import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:aman_project/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PropertyManagement {
  //Get Cards List(Used At Search File)
  static List<String> docIDs = [];
  static Future getDocId() async {
    //There is a hidden feature here we need to test remove doIDS and see what happen when you navigate
    docIDs = [];
    await FirebaseFirestore.instance
        .collection('properties')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              docIDs.add(document.reference.id);
            }));
    // listNumber = docIDs.length;
  }
}

final propertyLengthProvider = FutureProvider((ref) {

  return PropertyManagement.docIDs.length;
});
