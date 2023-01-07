import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chart_data.dart';
import '../models/property.dart';

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
    await docProperty.set(json);
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

  static deleteProduct(String id) async {
    DocumentReference docRef =
        FirebaseFirestore.instance.collection('properties').doc(id);

    docRef.delete();
  }

  static Future<List<Property>> getWishlistData(List<String> ids) async {
    List<Property> results = [];

    for (var id in ids) {
      await FirebaseFirestore.instance
          .collection('properties')
          .doc(id)
          .get()
          .then((querySnapshot) {
        results.add(Property(
            docId: id,
            addressAdmin: querySnapshot.data()!['addressForAdmin'],
            addressUser: querySnapshot.data()!['addressForUser'],
            area: querySnapshot.data()!['area'],
            descriptionAdmin: querySnapshot.data()!['descriptionForAdmin'],
            descriptionUser: querySnapshot.data()!['descriptionForUser'],
            unitName: querySnapshot.data()!['unitName'],
            offered: querySnapshot.data()!['offered'],
            ownerName: querySnapshot.data()!['ownerName'],
            ownerNumber: querySnapshot.data()!['ownerNumber'],
            paymentMethod: querySnapshot.data()!['paymentMethod'],
            priority: querySnapshot.data()!['priority'],
            type: querySnapshot.data()!['type'],
            visible: querySnapshot.data()!['visible'],
            price: querySnapshot.data()!['price'],
            multiImages: querySnapshot.data()!['multiImages'],
            singleImage: querySnapshot.data()!['singleImage'],
            doublex: querySnapshot.data()!['doublex'],
            finishing: querySnapshot.data()!['finishing'],
            floor: querySnapshot.data()!['floor'],
            furnished: querySnapshot.data()!['furnished'],
            noBathrooms: querySnapshot.data()!['noBathrooms'],
            noFlats: querySnapshot.data()!['noFlats'],
            noFloors: querySnapshot.data()!['noFloors'],
            noRooms: querySnapshot.data()!['noRooms'],
            theNumberOFAB: querySnapshot.data()!['theNumberOFAB'],
            typeOFActivity: querySnapshot.data()!['typeOFActivity']));
      });
    }
    return results;
  }

  static Future<List<ChartData>> getData() async {
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
