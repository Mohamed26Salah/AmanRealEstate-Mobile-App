import 'package:aman_project/models/number.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NumberManagement {
  static Future<List<Number>> getNumbers() async {
    List<Number> data = [];
    try {
      await FirebaseFirestore.instance
          .collection('Numbers')
          .get()
          .then((QuerySnapshot querySnapshot) {
        for (var doc in querySnapshot.docs) {
          data.add(
              Number(Id: doc.id, name: doc['name'], number: doc['number']));
        }
      });

      return data;
    } catch (e) {
      return data;
    }
  }

  static Future<String> addNumber(String id, String name, String number) async {
    try {
      final docNumber = FirebaseFirestore.instance.collection('Numbers').doc();
      Number num = Number(Id: id, name: name, number: number);
      var json = num.toJson();
      docNumber.set(json);
      return docNumber.id;
    } catch (e) {
      return '';
    }
  }

  static Future<bool> deleteNumber(String id) async {
    try {
      DocumentReference docRef =
          FirebaseFirestore.instance.collection('Numbers').doc(id);
      await docRef.delete();
      return true;
    } on FirebaseException catch (e) {
      // print(e);
      return false;
    }
  }
}
