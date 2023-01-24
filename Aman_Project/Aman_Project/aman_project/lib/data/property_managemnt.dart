import 'package:aman_project/data/image_management.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/chart_data.dart';
import '../models/property.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class PropertyManagement {
  //Read data for main Page
  static Stream<QuerySnapshot> allProperties() {
    return FirebaseFirestore.instance.collection('properties').snapshots();
  }

  static Stream<QuerySnapshot> searchedProperties(String coming) {
    return FirebaseFirestore.instance
        .collection('properties')
        .where("unitName", isGreaterThanOrEqualTo: coming.toLowerCase())
        .snapshots();
  }

  addPropertyData({
    required String type,
    required String ownerName,
    required String ownerNumber,
    required String addressForUser,
    required String addressForAdmin,
    required int area,
    required int price,
    required String descriptionForUser,
    required String descriptionForAdmin,
    required String unitName,
    required String paymentMethod,
    required String priority,
    required String visible,
    required String offered,
    // required List<dynamic> commonUnitPrpoerties,
    required String singleImage,
    required List<dynamic> mutliImages,
    String? typeOFActivity,
    String? noAB,
    String? noFloors,
    String? noFlats,
    String? noRooms,
    String? noBathrooms,
    String? finishing,
    String? furnished,
    String? floor,
    String? doublex,
  }) async {
    final docProperty =
        FirebaseFirestore.instance.collection('properties').doc();
    final property = Property(
      type: type,
      ownerName: ownerName,
      ownerNumber: ownerNumber,
      addressUser: addressForUser,
      addressAdmin: addressForAdmin,
      area: area,
      price: price,
      descriptionUser: descriptionForUser,
      descriptionAdmin: descriptionForAdmin,
      unitName: unitName,
      paymentMethod: paymentMethod,
      priority: priority,
      visible: visible,
      offered: offered,
      singleImage: singleImage,
      multiImages: mutliImages,
      typeOFActivity: typeOFActivity,
      theNumberOFAB: noAB,
      noFloors: noFloors,
      noFlats: noFlats,
      noRooms: noRooms,
      noBathrooms: noBathrooms,
      finishing: finishing,
      furnished: furnished,
      floor: floor,
      doublex: doublex,
    );
    final json = property.toJson();
    try {
      await docProperty.set(json);
    } on FirebaseException catch (e) {
    }
  }

  static Future updateProperty({
    required String docId,
    required String ownerName,
    required String ownerNumber,
    required String addressForUser,
    required String addressForAdmin,
    required int area,
    required int price,
    required String descriptionForUser,
    required String descriptionForAdmin,
    required String unitName,
    required String paymentMethod,
    required String priority,
    required String visible,
    required String offered,
    required String singleImage,
    required List<dynamic> mutliImages,
    required String type,
    String? typeOFActivity,
    String? noAB,
    String? noFloors,
    String? noFlats,
    String? noRooms,
    String? noBathrooms,
    String? finishing,
    String? furnished,
    String? floor,
    String? doublex,
  }) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.doc('properties/$docId');
      final property = Property(
        type: type,
        ownerName: ownerName,
        ownerNumber: ownerNumber,
        addressUser: addressForUser,
        addressAdmin: addressForAdmin,
        area: area,
        price: price,
        descriptionUser: descriptionForUser,
        descriptionAdmin: descriptionForAdmin,
        unitName: unitName,
        paymentMethod: paymentMethod,
        priority: priority,
        visible: visible,
        offered: offered,
        singleImage: singleImage,
        multiImages: mutliImages,
        typeOFActivity: typeOFActivity,
        theNumberOFAB: noAB,
        noFloors: noFloors,
        noFlats: noFlats,
        noRooms: noRooms,
        noBathrooms: noBathrooms,
        finishing: finishing,
        furnished: furnished,
        floor: floor,
        doublex: doublex,
      );
      final json = property.toJson();
      docRef.update(json);
    } on FirebaseException catch (e) {
    }
  }

  static deleteProduct(String id, String singleImage, List<dynamic> multiImages,
      BuildContext context) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('properties').doc(id);
      ImageManagement.deleteSingleImage(singleImage);
      ImageManagement.deleteMultiImages(multiImages);
      docRef.delete();
    } on FirebaseException catch (e) {
    }
  }

  static Future<List<dynamic>> getWishlistData(List<String> ids) async {
    List<Property> results = [];
    List<String> removedIDs = [];
    for (var id in ids) {
      try {
        await FirebaseFirestore.instance
            .collection('properties')
            .doc(id)
            .get()
            .then((querySnapshot) {
          var property = Property.fromJson(querySnapshot.data()!, id);
          results.add(property);
        });
      } catch (e) {
        removedIDs.add(id);
      }
    }
    return [results, removedIDs];
  }

  static Future<List<ChartData>> getPropertiesType() async {
    List data = [];
    Map datanum = {};
    List<ChartData> datanum2 = [];

    await FirebaseFirestore.instance
        .collection('properties')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        data.add(doc["type"]);
      }
    });

    for (var e in data) {
      datanum.containsKey(e) ? datanum[e]++ : datanum[e] = 1;
    }
    datanum.forEach((k, v) => datanum2.add(ChartData(k, v)));

    return datanum2;
  }
}
