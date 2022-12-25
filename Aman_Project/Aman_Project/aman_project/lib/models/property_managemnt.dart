import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PropertyManagement {
  //Read data for main Page
  static Stream<QuerySnapshot> allProperties() {
    return FirebaseFirestore.instance.collection('properties').snapshots();
  }

  static Stream<QuerySnapshot> searchedProperties(String coming) {
    return FirebaseFirestore.instance
        .collection('properties')
        .where("unitName", isGreaterThanOrEqualTo: coming)
        .snapshots();
  }

  static Query<Map<String, dynamic>> roomFilter(
      CollectionReference<Map<String, dynamic>> properties,
      String roomFilter,
      Query<Map<String, dynamic>>? returnedQueryFilter) {
    if (roomFilter == "Any") {
      return returnedQueryFilter =
          properties.where("noRooms", isNotEqualTo: "");
    }
    return returnedQueryFilter =
        properties.where("noRooms", isEqualTo: roomFilter);
  }

  static Query<Map<String, dynamic>> bathroomFilter(
      CollectionReference<Map<String, dynamic>> properties,
      String bathroomFilter,
      Query<Map<String, dynamic>>? returnedQueryFilter) {
    if (bathroomFilter == "Any") {
      return returnedQueryFilter =
          properties.where("noBathrooms", isNotEqualTo: "");
    }
    return returnedQueryFilter =
        properties.where("noBathrooms", isEqualTo: bathroomFilter);
  }

  static Query<Map<String, dynamic>> typeFilter(
      CollectionReference<Map<String, dynamic>> properties,
      String typeFilter,
      Query<Map<String, dynamic>>? returnedQueryFilter) {
    return returnedQueryFilter =
        properties.where("type", isEqualTo: typeFilter);
  }

  static Query<Map<String, dynamic>> priceRangeFilter(
      CollectionReference<Map<String, dynamic>> properties,
      RangeValues priceFilter,
      Query<Map<String, dynamic>>? returnedQueryFilter) {
    return returnedQueryFilter = properties
        .where("price", isLessThanOrEqualTo: priceFilter.end)
        .where("price", isGreaterThanOrEqualTo: priceFilter.start);
  }

  static Query<Map<String, dynamic>> areaRangeFilter(
      CollectionReference<Map<String, dynamic>> properties,
      RangeValues areaFilter,
      Query<Map<String, dynamic>>? returnedQueryFilter) {
    return returnedQueryFilter = properties
        .where("area", isLessThanOrEqualTo: areaFilter.end)
        .where("area", isGreaterThanOrEqualTo: areaFilter.start);
  }

  static Future getFlatData(
      {required List<dynamic> commonUnitPrpoerties,
      required String floor,
      required String doublex,
      required String noRooms,
      required String noBathrooms,
      required String finishing,
      required String furnished,
      required String singleImage,
      required List<dynamic> mutliImages,
      String type = "Flat"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'floor': floor,
      'doublex': doublex,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'noFloors': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getVillaData(
      {required List<dynamic> commonUnitPrpoerties,
      required String noFloors,
      required String noRooms,
      required String noBathrooms,
      required String finishing,
      required String furnished,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Villa"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getBuildingData(
      {required List<dynamic> commonUnitPrpoerties,
      required String noFloors,
      required String noFlats,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Building"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noFlats': noFlats,
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': ""
    });
  }

  static Future getClinicXStoreXLandXFactoryXOtherData(
      {required List<dynamic> commonUnitPrpoerties,
      required String typeOFActivity,
      required String singleImage,
      required List<String> mutliImages,
      required String type}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'noAB': ""
    });
  }

  static Future getFarmData(
      {required List<dynamic> commonUnitPrpoerties,
      required String typeOFActivity,
      required String noAB,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Farm"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'type': type,
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noAB': noAB,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
    });
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
    DocumentReference docRef =
        FirebaseFirestore.instance.doc('properties/$docId');
    docRef.update({
      'type': type,
      'ownerName': ownerName,
      'ownerNumber': ownerNumber,
      'addressForUser': addressForUser,
      'addressForAdmin': addressForAdmin,
      'area': area,
      'price': price,
      'descriptionForUser': descriptionForUser,
      'descriptionForAdmin': descriptionForAdmin,
      'unitName': unitName,
      'paymentMethod': paymentMethod,
      'priority': priority,
      'visible': visible,
      'offered': offered,
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity ?? "",
      'noAB': noAB ?? "",
      'noFloors': noFloors ?? "",
      'noFlats': noFlats ?? "",
      'noRooms': noRooms ?? "",
      'noBathrooms': noBathrooms ?? "",
      'finishing': finishing ?? "",
      'furnished': furnished ?? "",
      'floor': floor ?? "",
      'doublex': doublex ?? "",
    });
    
  }
}
