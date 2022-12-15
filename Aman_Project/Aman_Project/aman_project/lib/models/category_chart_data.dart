import 'package:cloud_firestore/cloud_firestore.dart';

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final int y;
}

Future<List<ChartData>> getData() async {
  List data = [];
  Map datanum = {};
  List<ChartData> datanum2 = [];

  await FirebaseFirestore.instance
      .collection('properties')
      .get()
      .then((QuerySnapshot querySnapshot) {
    for (var doc in querySnapshot.docs) {
      data.add(doc["type"]);
    }
  });
  // await FirebaseFirestore.instance
  //     .collection('properties')
  //     .get()
  //     .then((QuerySnapshot querySnapshot) {
  //   for (var doc in querySnapshot.docs) {
  //     data!.add(doc["Type"]);

  //   }
  // });

  for (var e in data) {
    datanum.containsKey(e) ? datanum[e]++ : datanum[e] = 1;
  }
  datanum.forEach((k, v) => datanum2.add(ChartData(k, v)));

  return datanum2;
}
