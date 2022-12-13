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
  // CollectionReference<Map<String, dynamic>> properties =FirebaseFirestore.instance.collection('properties');
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

  static getFlatData(
      {
      // required String ownerName,
      // required String ownerNumber,
      // required String addressForUser,
      // required String addressForAdmin,
      // required String area,
      // required String price,
      // required String descriptionForUser,
      // required String descriptionForAdmin,
      // required String unitName,
      // required String paymentMethod,
      // required String priority,
      // required String visible,
      // required String offered,
      required List<String> commonUnitPrpoerties,
      required String floor,
      required String doublex,
      required String noRooms,
      required String noBathrooms,
      required String finishing,
      required String furnished,
      required String singleImage,
      required List<String> mutliImages,
      String type = "Flat"}) async {
    await FirebaseFirestore.instance.collection('properties').add({
      'ownerName': commonUnitPrpoerties[0],
      'ownerNumber': commonUnitPrpoerties[1],
      'addressForUser': commonUnitPrpoerties[2],
      'addressForAdmin': commonUnitPrpoerties[3],
      'area': commonUnitPrpoerties[4],
      'price': commonUnitPrpoerties[5],
      'descriptionForUser': commonUnitPrpoerties[6],
      'descriptionForAdmin': commonUnitPrpoerties[7],
      'unitName': commonUnitPrpoerties[8],
      'OwnerName': commonUnitPrpoerties[9],
      'paymentMethod': commonUnitPrpoerties[10],
      'priority': commonUnitPrpoerties[11],
      'visible': commonUnitPrpoerties[12],
      'offered': commonUnitPrpoerties[13],
      'singleImage': singleImage,
      'mutliImages': mutliImages,
      'floor': floor,
      'doublex': doublex,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
    });
  }

  static getVillaData(
      {required List<String> commonUnitPrpoerties,
      required String floor,
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
      'OwnerName': commonUnitPrpoerties[9],
      'paymentMethod': commonUnitPrpoerties[10],
      'priority': commonUnitPrpoerties[11],
      'visible': commonUnitPrpoerties[12],
      'offered': commonUnitPrpoerties[13],
      'singleImage': singleImage,
      'mutliImages': mutliImages,
      'floor': floor,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished
    });
  }

  static getBuildingData(
      {required List<String> commonUnitPrpoerties,
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
      'noFloors': noFloors,
      'noFlats': noFlats,
      'singleImage': singleImage,
      'mutliImages': mutliImages
    });
  }

  static getClinicXStoreXLandXFactoryXOtherData(
      {required List<String> commonUnitPrpoerties,
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
      'typeOFActivity': typeOFActivity,
      'singleImage': singleImage,
      'mutliImages': mutliImages
    });
  }

  static getFarmData(
      {required List<String> commonUnitPrpoerties,
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
      'typeOFActivity': typeOFActivity,
      'noAB': noAB,
      'singleImage': singleImage,
      'mutliImages': mutliImages
    });
  }
}

final propertyLengthProvider = FutureProvider((ref) {
  return PropertyManagement.docIDs.length;
});
