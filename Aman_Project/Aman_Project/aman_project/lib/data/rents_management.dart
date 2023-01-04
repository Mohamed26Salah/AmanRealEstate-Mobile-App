import 'package:aman_project/models/rent.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    if (currentDate.isBefore(startOFRent) || currentDate.isBefore(tor)) {
      return "DidntStart";
    } else if (currentDate.isAfter(endOFRent)) {
      return "Finished";
    } else if (currentDate.isAfter(tor) ||
        currentDate.isBefore(torEnd) ||
        currentDate.isAtSameMomentAs(tor) ||
        currentDate.isAtSameMomentAs(torEnd)) {
      return "Payed";
    } else if (currentDate.isAfter(torEnd) ||
        currentDate.isBefore(endOFRent) ||
        currentDate.isAtSameMomentAs(endOFRent)) {
      return "DidntPay";
    }
    return "Error";
  }
}
