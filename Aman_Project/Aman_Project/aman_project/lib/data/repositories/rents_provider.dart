import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rentsButtonProivder = StateProvider<bool>((ref) {
  return false;
});

final didntStartSP = StreamProvider((ref) {
  print("prov1");
  return FirebaseFirestore.instance
      .collection('rents')
      .where("rentType", isEqualTo: "DidntStart")
      .snapshots();
});

final finishedSP = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('rents')
      .where("rentType", isEqualTo: "Finished")
      .snapshots();
});

final payedSP = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('rents')
      .where("rentType", isEqualTo: "Payed")
      .snapshots();
});

final didntPaySP = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('rents')
      .where("rentType", isEqualTo: "DidntPay")
      .snapshots();
});

final searchedRents = StreamProvider((ref) {
  return FirebaseFirestore.instance
      .collection('rents')
      .where("rentType", isEqualTo: ref.watch(rentTypeUserChoice))
      .where("lessorName",
          isGreaterThanOrEqualTo:
              ref.watch(searchInputProivderRent).toLowerCase())
      .snapshots();
});

final searchInputProivderRent = StateProvider<String>((ref) {
  return "";
});
final rentTypeUserChoice = StateProvider<String>((ref) {
  return "";
});
final resultsCountRent = StateProvider<int>((ref) {
  return 0;
});
