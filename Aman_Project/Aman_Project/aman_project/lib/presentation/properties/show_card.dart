import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:aman_project/presentation/shared_features/custom_loading_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';

class ShowCard extends ConsumerStatefulWidget {
  const ShowCard({super.key});

  @override
  ConsumerState<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends ConsumerState<ShowCard> {
  @override
  void dispose() {
    super.dispose();
  }

  Query query = FirebaseFirestore.instance.collection('properties');
  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(newUserDataProivder);
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

    try {
      return choosedPropertyTypeToGetData.when(data: (data) {
        Future.delayed(const Duration(milliseconds: 100), () {
          ref.read(resultsCountProperty.notifier).state = data.size;
        });
        return (data.size != 0)
            ? NoGlowScroll(
                child: ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    // if (mounted) {}
                    // Future.delayed(const Duration(milliseconds: 100), () {
                    //   ref.read(resultsCount.notifier).state = data.size;
                    // });
                    var property = Property.fromJson(
                        data.docs[index].data(), data.docs[index].id);
                    if (userData!.role == "user") {
                      if (property.visible == "No") {
                        return const SizedBox.shrink();
                      } else {
                        return PropertyWidget(
                          property: property,
                        );
                      }
                    } else {
                      return PropertyWidget(
                        property: property,
                      );
                    }
                  },
                ),
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/NotFound.png", width: 100),
                    const SizedBox(height: 15),
                    Text(
                      'No Data is Found'.tr,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
      }, loading: () {
        return const Center(
          child: LoadingScreen(),
        );
      }, error: (error, stack) {
        return Center(
          child: Text(error.toString()),
        );
      });
    } on Error catch (e) {
      // print(e);
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
