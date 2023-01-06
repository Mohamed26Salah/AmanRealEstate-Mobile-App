import 'package:aman_project/models/rent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/chart_data.dart';

class RentsManagement {
  static createRent(
      {required int rentPrice,
      required String type,
      required int area,
      required String floor,
      required String lessorName,
      required String tenantName,
      required String lessorNum,
      required String tenantNum,
      required String description,
      required String furnished,
      required String finishing,
      required DateTime tor,
      required DateTime torEnd,
      required DateTime startOFRent,
      required DateTime endOFRent,
      required String rentType}) async {
    final docRent = FirebaseFirestore.instance.collection('rents').doc();
    final rent = Rents(
        rentPrice: rentPrice,
        type: type,
        area: area,
        floor: floor,
        lessorName: lessorName,
        tenantName: tenantName,
        lessorNum: lessorNum,
        tenantNum: tenantNum,
        description: description,
        furnished: furnished,
        finishing: finishing,
        tor: tor,
        torEnd: torEnd,
        startOFRent: startOFRent,
        endOFRent: endOFRent,
        rentType: rentType);
    final json = rent.toJson();
    await docRent.set(json);
  }

// if equal!!
  static String figureRentType(
      DateTime startOFRent, DateTime endOFRent, DateTime tor, DateTime torEnd) {
    var currentDate = DateTime.now();
    var returnedType = "error";
    if (currentDate.isBefore(startOFRent) ||
        (currentDate.isBefore(tor) && currentDate.isAfter(startOFRent))) {
      returnedType = "DidntStart";
    } else if (currentDate.isAfter(endOFRent) ||
        currentDate.isAtSameMomentAs(endOFRent)) {
      returnedType = "Finished";
    } else if ((currentDate.isAfter(tor) && currentDate.isBefore(torEnd)) ||
        (currentDate.isAtSameMomentAs(tor) ||
            currentDate.isAtSameMomentAs(torEnd))) {
      returnedType = "Payed";
    } else if (currentDate.isAfter(torEnd) && currentDate.isBefore(endOFRent)) {
      returnedType = "DidntPay";
    }
    return returnedType;
  }

  static Future<List<ChartData>> getData3() async {
    List data = [];
    Map datanum = {};
    List<ChartData> datanum2 = [];

    await FirebaseFirestore.instance
        .collection('rents')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        data.add(doc["rentType"]);
      }
    });

    for (var e in data) {
      datanum.containsKey(e) ? datanum[e]++ : datanum[e] = 1;
    }
    datanum.forEach((k, v) => datanum2.add(ChartData(k, v)));

    return datanum2;
  }

// it should be done using Cloud Functions
  static updateRentsType() async {
    try {
      FirebaseFirestore.instance.collection('rents').get().then((value) {
        for (var element in value.docs) {
          var rent = Rents.fromJson(element.data());
          var rentType = figureRentType(
              rent.startOFRent, rent.endOFRent, rent.tor, rent.torEnd);
          if (rentType != rent.rentType) {
            FirebaseFirestore.instance
                .collection('rents')
                .doc(element.id)
                .update({"rentType": rentType});
          }
          // FirebaseFirestore.instance.collection('rents').doc(element.id).update;
        }
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
