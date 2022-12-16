import 'package:aman_project/presentation/properties/property_widget_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowCard extends StatefulWidget {
  const ShowCard({super.key});

  @override
  State<ShowCard> createState() => _ShowCardState();
}

class _ShowCardState extends State<ShowCard> {
  final Stream<QuerySnapshot> properties =
      FirebaseFirestore.instance.collection('properties').snapshots();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: properties,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
        final data = snapshot.requireData;
        return ListView.builder(
          itemCount: data.size,
          itemBuilder: (context, index) {
            return PropertyWidget(
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
          },
        );
      },
    );
  }
}