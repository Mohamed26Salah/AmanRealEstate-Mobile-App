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
    try {
      await docRent.set(json);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  static editRent(
      {required String docId,
      required int rentPrice,
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
    DocumentReference docRef = FirebaseFirestore.instance.doc('rents/$docId');
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
    try {
      docRef.update(json);
    } on FirebaseException catch (e) {
      print(e);
    }
  }

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

  static DateTime addDaysToStartRent(DateTime tor, {int addedTime = 30}) {
    tor = DateTime(tor.year, tor.month, tor.day);
    return (tor.add(Duration(days: addedTime)));
  }

  static DateTime addDaysToEndRent(DateTime torEnd, {int addedTime = 30}) {
    torEnd = DateTime(torEnd.year, torEnd.month, torEnd.day);
    return (torEnd.add(Duration(days: addedTime)));
  }

  static updateRentDaysDifference(String docId, Rents routeArgs) {
    try {
      int difference = daysBetween(routeArgs.tor, routeArgs.torEnd);
      routeArgs.tor = addDaysToStartRent(routeArgs.tor, addedTime: difference);
      routeArgs.torEnd =
          addDaysToEndRent(routeArgs.torEnd, addedTime: difference);
      routeArgs.rentType = RentsManagement.figureRentType(routeArgs.startOFRent,
          routeArgs.endOFRent, routeArgs.tor, routeArgs.torEnd);
      updateTorAndTorEnd(routeArgs.tor, routeArgs.torEnd, docId,
          routeArgs.startOFRent, routeArgs.endOFRent, routeArgs.rentType);
    } catch (e) {
      print(e);
      // return [];
    }
  }

  static updateRents30Days(String docId, Rents routeArgs) async {
    try {
      routeArgs.tor = addDaysToStartRent(routeArgs.tor);
      routeArgs.torEnd = addDaysToEndRent(routeArgs.torEnd);
      routeArgs.rentType = RentsManagement.figureRentType(routeArgs.startOFRent,
          routeArgs.endOFRent, routeArgs.tor, routeArgs.torEnd);
      updateTorAndTorEnd(routeArgs.tor, routeArgs.torEnd, docId,
          routeArgs.startOFRent, routeArgs.endOFRent, routeArgs.rentType);
    } catch (e) {
      print(e);
    }
  }

  static updateRentsCustomDays(
      String docId, int customDays, Rents routeArgs) async {
    try {
      routeArgs.tor = addDaysToStartRent(routeArgs.tor, addedTime: customDays);
      routeArgs.torEnd =
          addDaysToEndRent(routeArgs.torEnd, addedTime: customDays);
      routeArgs.rentType = RentsManagement.figureRentType(routeArgs.startOFRent,
          routeArgs.endOFRent, routeArgs.tor, routeArgs.torEnd);
      updateTorAndTorEnd(routeArgs.tor, routeArgs.torEnd, docId,
          routeArgs.startOFRent, routeArgs.endOFRent, routeArgs.rentType);
    } catch (e) {
      print(e);
    }
  }

  static updateTorAndTorEnd(DateTime tor, DateTime torEnd, String docId,
      DateTime startOFContract, DateTime endOFContract, String rentType) {
    DocumentReference docRef = FirebaseFirestore.instance.doc('rents/$docId');
    // var rentType = RentsManagement.figureRentType(
    //     startOFContract, endOFContract, tor, torEnd);
    try {
      docRef.update({
        'rentType': rentType,
        'tor': tor,
        'torEnd': torEnd,
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  static String figureHowManyDaysLeft(DateTime startOFRent, DateTime endOFRent,
      DateTime tor, DateTime torEnd, String rentType) {
    var currentDate = DateTime.now();
    String daysLeft = "";
    // var returnedType = "error";
    if (rentType == "DidntStart") {
      daysLeft = daysBetween(currentDate, tor).toString();
    } else if (rentType == "Finished") {
      daysLeft = daysBetween(endOFRent, currentDate).toString();
    } else if (rentType == "Payed") {
      daysLeft = daysBetween(currentDate, torEnd).toString();
    } else if (rentType == "DidntPay") {
      daysLeft = daysBetween(torEnd, currentDate).toString();
    }
    return daysLeft;
  }

  static Future<List<ChartData>> getRentsType() async {
    List data = [];
    Map datanum = {};
    List<ChartData> datanum2 = [];
    try {
      await FirebaseFirestore.instance
          .collection('rents')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          data.add(doc["rentType"]);
        }
      });
    } on FirebaseException catch (e) {
      print(e);
    }

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
          var rent =
              Rents.fromJson(element.data(), element.id); //hena fe t8yeer
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

  static deleteRent(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('rents').doc(id);
      docRef.delete();
    } on FirebaseException catch (e) {
      print(e);
    }
  }
}
