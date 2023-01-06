import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rentsButtonProivder = StateProvider<bool>((ref) {
  return false;
});

final didntStartSP = StreamProvider((ref) {
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
