import 'package:aman_project/models/property.dart';
import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ShowCard extends ConsumerStatefulWidget {
  const ShowCard({super.key});

  @override
  ConsumerState<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends ConsumerState<ShowCard> {
  Query query = FirebaseFirestore.instance.collection('properties');
  @override
  Widget build(BuildContext context) {
    String coming = ref.watch(searchInputProivder);
    var choosedPropertyTypeToGetData = ref.watch(getPropertyData);
    (coming != "")
        ? choosedPropertyTypeToGetData = ref.watch(searchedProperty)
        : (ref.watch(filterTypeProivder) != "" ||
                ref.watch(filterRoomProivder) != "" ||
                ref.watch(filterBathroomProivder) != "" ||
                ref.watch(filterPriceProivder) != "")
            ? choosedPropertyTypeToGetData = ref.watch(filteredProperty)
            : choosedPropertyTypeToGetData = ref.watch(getPropertyData);

    // if (ref.watch(filterTypeProivder) != "" ||
    //     ref.watch(filterRoomProivder) != "" ||
    //     ref.watch(filterBathroomProivder) != "" ||
    //     ref.watch(filterPriceProivder) != "") {
    //   choosedPropertyTypeToGetData = ref.watch(filteredProperty);
    // }
    // if (coming != "") {
    //   choosedPropertyTypeToGetData = ref.watch(searchedProperty);
    // }

    // if ((ref.watch(filterTypeProivder) != "" ||
    //         ref.watch(filterRoomProivder) != "" ||
    //         ref.watch(filterBathroomProivder) != "" ||
    //         ref.watch(filterPriceProivder) != "") &&
    //     coming != "") {
    //   choosedPropertyTypeToGetData = ref.watch(filteredProperty);
    // }
    try {
      return choosedPropertyTypeToGetData.when(data: (data) {
        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            var property =
                Property.fromJson(data.docs[index].data(), data.docs[index].id);
            return PropertyWidget(
              property: property,
            );
          },
        );
      }, loading: () {
        return Center(
            child: LoadingAnimationWidget.dotsTriangle(
          color: const Color.fromARGB(255, 205, 153, 51),
          size: 80,
        ));
      }, error: (error, stack) {
        return Center(
          child: Text(error.toString()),
        );
      });
    } on Error catch (e) {
      print(e);
      return Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.error, color: Colors.red, size: 48),
            SizedBox(height: 16),
            Text("Something went wrong", style: TextStyle(fontSize: 24)),
          ],
        ),
      ));
    }
  }
}
