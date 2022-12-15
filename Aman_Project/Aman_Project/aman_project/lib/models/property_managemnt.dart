import 'package:cloud_firestore/cloud_firestore.dart';

class PropertyManagement {
//Return DocID data For Each Card

  static Future getFlatData(
      {required List<String> commonUnitPrpoerties,
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
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'floor': floor,
      'doublex': doublex,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'noFloors': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getVillaData(
      {required List<String> commonUnitPrpoerties,
      required String noFloors,
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
      'paymentMethod': commonUnitPrpoerties[9],
      'priority': commonUnitPrpoerties[10],
      'visible': commonUnitPrpoerties[11],
      'offered': commonUnitPrpoerties[12],
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noRooms': noRooms,
      'noBathrooms': noBathrooms,
      'finishing': finishing,
      'furnished': furnished,
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': "",
      'noFlats': ""
    });
  }

  static Future getBuildingData(
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
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'noFloors': noFloors,
      'noFlats': noFlats,
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'typeOFActivity': "",
      'noAB': ""
    });
  }

  static Future getClinicXStoreXLandXFactoryXOtherData(
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
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
      'noAB': ""
    });
  }

  static Future getFarmData(
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
      'singleImage': singleImage,
      'multiImages': mutliImages,
      'typeOFActivity': typeOFActivity,
      'noAB': noAB,
      'noFloors': "",
      'noFlats': "",
      'noRooms': "",
      'noBathrooms': "",
      'finishing': "",
      'furnished': "",
      'floor': "",
      'doublex': "",
    });
  }
}


  //Get Cards List(Used At Search File)
  // static List<String> docIDs = [];
  // // CollectionReference<Map<String, dynamic>> properties =FirebaseFirestore.instance.collection('properties');
  // static Future getDocId() async {
  //   //There is a hidden feature here we need to test remove doIDS and see what happen when you navigate
  //   docIDs = [];
  //   await FirebaseFirestore.instance
  //       .collection('properties')
  //       .get()
  //       .then((snapshot) => snapshot.docs.forEach((document) {
  //             docIDs.add(document.reference.id);
  //           }));
  // }

// final propertyLengthProvider = FutureProvider((ref) {
//   return PropertyManagement.docIDs.length;
// });

// class PropertyItem extends StatelessWidget {
//   final String documentID;

//   PropertyItem({required this.documentID});

//   @override
//   Widget build(BuildContext context) {
//     CollectionReference properties =
//         FirebaseFirestore.instance.collection('properties');
//     return FutureBuilder<DocumentSnapshot>(
//       future: properties.doc(documentID).get(),
//       builder: (context, snapshot) {
//         print(documentID);
//         print("Fasl");
//         if (snapshot.connectionState == ConnectionState.done) {
//           Map<String, dynamic> data =
//               snapshot.data!.data() as Map<String, dynamic>;
//           return PropertyWidget(
//             addressAdmin: data['addressForAdmin'],
//             addressUser: data['addressForUser'],
//             area: data['area'],
//             descriptionAdmin: data['descriptionForAdmin'],
//             descriptionUser: data['descriptionForUser'],
//             singleImage: data['singleImage'],
//             multiImages: data['multiImages'],
//             offered: data['offered'],
//             ownerName: data['ownerName'],
//             ownerNumber: data['ownerNumber'],
//             paymentMethod: data['paymentMethod'],
//             price: data['price'],
//             priority: data['priority'],
//             type: data['type'],
//             visible: data['visible'],
//             //Uncommon
//             doublex: data['Doublex'],
//             finishing: data['Finishing'],
//             floor: data['Floor'],
//             furnished: data['Furnished'],
//             unitName: data['unitName'],
//             noBarthrooms: data['No.Bathrooms'],
//             noFlats: data['No.Flats'],
//             noFloors: data['No.Floors'],
//             noRooms: data['No.Rooms'],
//             theNumberOFAB: data['TheNumberOFAB'],
//             typeOFActivity: data['TypeOfActivity'],
//           );
//         }
//         return Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Container(
//               child: const CircularProgressIndicator(
//                 value: null,
//                 strokeWidth: 7.0,
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
