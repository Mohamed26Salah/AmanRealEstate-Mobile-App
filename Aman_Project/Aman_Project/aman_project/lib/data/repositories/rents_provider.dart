import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final rentsButtonProivder = StateProvider<bool>((ref) {
  return false;
});
//First Type
// var didntStartSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntStart")
//       .snapshots();
// });

// var finishedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Finished")
//       .snapshots();
// });

// var payedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Payed")
//       .snapshots();
// });

// var didntPaySP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntPay")
//       .snapshots();
// });
// void resetStreamProvsRents() {
//  didntStartSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntStart")
//       .snapshots();
// });

//  finishedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Finished")
//       .snapshots();
// });

//  payedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Payed")
//       .snapshots();
// });

//  didntPaySP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntPay")
//       .snapshots();
// });
// }
/////////////////////////////////////////////////////////////////////////////////////

// final didntStartSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntStart")
//       .snapshots();
// });

// final finishedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Finished")
//       .snapshots();
// });

// final payedSP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "Payed")
//       .snapshots();
// });

// final didntPaySP = StreamProvider((ref) {
//   return FirebaseFirestore.instance
//       .collection('rents')
//       .where("rentType", isEqualTo: "DidntPay")
//       .snapshots();
// });
/////////////////////////////////////////////////////////////////////////
final _didntStartSPController =
    StreamController<QuerySnapshot<Map<String, dynamic>>>();
final didntStartSP = StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  FirebaseAuth.instance.idTokenChanges().listen((user) {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('rents')
          .where("rentType", isEqualTo: "DidntStart")
          .snapshots()
          .listen((snapshot) => _didntStartSPController.add(snapshot));
    } else {
      _didntStartSPController.addStream(const Stream.empty());
    }
  });
  return _didntStartSPController.stream;
});
////////////////////////////////////////////////////
final _finishedSPController =
    StreamController<QuerySnapshot<Map<String, dynamic>>>();
final finishedSP = StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  FirebaseAuth.instance.idTokenChanges().listen((user) {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('rents')
          .where("rentType", isEqualTo: "Finished")
          .snapshots()
          .listen((snapshot) => _finishedSPController.add(snapshot));
    } else {
      _finishedSPController.addStream(const Stream.empty());
    }
  });
  return _finishedSPController.stream;
});
///////////////////////////////////////////////////////////////////////
final _payedSPController =
    StreamController<QuerySnapshot<Map<String, dynamic>>>();
final payedSP = StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  FirebaseAuth.instance.idTokenChanges().listen((user) {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('rents')
          .where("rentType", isEqualTo: "Payed")
          .snapshots()
          .listen((snapshot) => _payedSPController.add(snapshot));
    } else {
      _payedSPController.addStream(const Stream.empty());
    }
  });
  return _payedSPController.stream;
});
////////////////////////////////////////////////////////////////////////
final _didntPaySPController =
    StreamController<QuerySnapshot<Map<String, dynamic>>>();
final didntPaySP = StreamProvider<QuerySnapshot<Map<String, dynamic>>>((ref) {
  FirebaseAuth.instance.idTokenChanges().listen((user) {
    if (user != null) {
      FirebaseFirestore.instance
          .collection('rents')
          .where("rentType", isEqualTo: "DidntPay")
          .snapshots()
          .listen((snapshot) => _didntPaySPController.add(snapshot));
    } else {
      _didntPaySPController.addStream(const Stream.empty());
    }
  });
  return _didntPaySPController.stream;
});
////////////////////////////////////////////////////////////////////////
final searchedRents = StreamProvider.autoDispose((ref) {
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
