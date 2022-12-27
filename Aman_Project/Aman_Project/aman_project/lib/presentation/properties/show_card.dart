import 'package:aman_project/models/property.dart';
import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShowCard extends ConsumerStatefulWidget {
  const ShowCard({super.key});

  @override
  ConsumerState<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends ConsumerState<ShowCard> {
  // Stream<QuerySnapshot> properties =
  //     FirebaseFirestore.instance.collection('properties').snapshots();

  // CollectionReference<Map<String, dynamic>> propertiesFiltered =
  //     FirebaseFirestore.instance.collection('properties');

  // Query<Map<String, dynamic>>? returnedQueryFilter;

  Query query = FirebaseFirestore.instance.collection('properties');
  @override
  Widget build(BuildContext context) {
    if (ref.watch(filterTypeProivder) != "") {
      query = query.where("type", isEqualTo: ref.watch(filterTypeProivder));
    }
    if (ref.watch(filterRoomProivder) != "") {
      if (ref.watch(filterRoomProivder) == "Any") {
        query = query.where("noRooms", isNotEqualTo: "");
      } else {
        query =
            query.where("noRooms", isEqualTo: ref.watch(filterRoomProivder));
      }
    }
    if (ref.watch(filterBathroomProivder) != "") {
      if (ref.watch(filterBathroomProivder) == "Any") {
        query = query.where("noBathrooms", isNotEqualTo: "");
      } else {
        query = query.where("noBathrooms",
            isEqualTo: ref.watch(filterBathroomProivder));
      }
    }
    if (ref.watch(filterPriceProivder) != "") {
      if (ref.watch(filterPriceProivder) == "LTH") {
        query = query.orderBy("price", descending: false);
      } else {
        query = query.orderBy("price", descending: true);
      }
    }

    String coming = ref.watch(searchInputProivder);
    // final Stream<QuerySnapshot> snapshott = query.snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: (coming != "")
          ? PropertyManagement.searchedProperties(coming)
          : (ref.watch(filterTypeProivder) != "" ||
                  ref.watch(filterRoomProivder) != "" ||
                  ref.watch(filterBathroomProivder) != "" ||
                  ref.watch(filterPriceProivder) != "")
              ? query.snapshots()
              : PropertyManagement.allProperties(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        query = FirebaseFirestore.instance.collection('properties');
        if (snapshot.hasError) {
          return const Card(
            color: Colors.red,
            margin: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Something is not right here...",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(
                backgroundColor: Colors.black26,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Color.fromARGB(255, 205, 153, 51)),
              ),
            ),
          );
        }

        if (snapshot.data?.size == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.not_interested,
                color: Colors.grey,
                size: 40,
              ),
              Text(
                "No Data has been found! according to your filter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "serif",
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 20,
                ),
              )
            ],
          );
        }
        final data = snapshot.requireData;

        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            Property property = Property(
              docId: data.docs[index].id,
              addressAdmin: data.docs[index]['addressForAdmin'],
              addressUser: data.docs[index]['addressForUser'],
              area: data.docs[index]['area'],
              descriptionAdmin: data.docs[index]['descriptionForAdmin'],
              descriptionUser: data.docs[index]['descriptionForUser'],
              singleImage: data.docs[index]['singleImage'],
              multiImages: data.docs[index]['multiImages'],
              offered: data.docs[index]['offered'],
              ownerName: data.docs[index]['ownerName'],
              ownerNumber: data.docs[index]['ownerNumber'],
              paymentMethod: data.docs[index]['paymentMethod'],
              price: data.docs[index]['price'],
              priority: data.docs[index]['priority'],
              type: data.docs[index]['type'],
              visible: data.docs[index]['visible'],
              //Uncommon
              doublex: data.docs[index]['doublex'],
              finishing: data.docs[index]['finishing'],
              floor: data.docs[index]['floor'],
              furnished: data.docs[index]['furnished'],
              unitName: data.docs[index]['unitName'],
              noBarthrooms: data.docs[index]['noBathrooms'],
              noFlats: data.docs[index]['noFlats'],
              noFloors: data.docs[index]['noFloors'],
              noRooms: data.docs[index]['noRooms'],
              theNumberOFAB: data.docs[index]['noAB'],
              typeOFActivity: data.docs[index]['typeOFActivity'],
            );
            // ref.read(resultsCount.notifier).state = data.size;
            return PropertyWidget(
              property: property,
            );
          },
        );
      },
    );
  }
}
