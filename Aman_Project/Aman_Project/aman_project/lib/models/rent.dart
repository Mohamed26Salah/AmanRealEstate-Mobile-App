import 'package:cloud_firestore/cloud_firestore.dart';

class Rents {
  // int docId;
  int rentPrice;
  String type;
  int area;
  String floor;
  String lessorName;
  String lessorNum;
  String tenantName;
  String tenantNum;
  String description;
  String furnished;
  String finishing;
  DateTime tor;
  DateTime torEnd;
  DateTime startOFRent;
  DateTime endOFRent;
  String rentType;
  Rents(
      {
      // required this.docId,
      required this.rentPrice,
      required this.type,
      required this.area,
      required this.floor,
      required this.lessorName,
      required this.tenantName,
      required this.lessorNum,
      required this.tenantNum,
      required this.description,
      required this.furnished,
      required this.finishing,
      required this.tor,
      required this.torEnd,
      required this.startOFRent,
      required this.endOFRent,
      required this.rentType});
  factory Rents.fromJson(Map<String, dynamic> json) => Rents(
      rentPrice: json["rentPrice"],
      type: json["type"],
      area: json["area"],
      floor: json["floor"],
      lessorName: json["lessorName"],
      tenantName: json["tenantName"],
      lessorNum: json["lessorNum"],
      tenantNum: json["tenantNum"],
      description: json["description"],
      furnished: json["furnished"],
      finishing: json["finishing"],
      tor: (json["tor"] as Timestamp).toDate(),
      torEnd: (json["torEnd"] as Timestamp).toDate(),
      startOFRent: (json["startOFRent"] as Timestamp).toDate(),
      endOFRent: (json["endOFRent"] as Timestamp).toDate(),
      rentType: json["rentType"]);
  Map<String, dynamic> toJson() => {
        "rentPrice": rentPrice,
        "type": type,
        "area": area,
        "floor": floor,
        "lessorName": lessorName,
        "tenantName": tenantName,
        "lessorNum": lessorNum,
        "tenantNum": tenantNum,
        "description": description,
        "furnished": furnished,
        "finishing": finishing,
        "tor": tor,
        "torEnd": torEnd,
        "startOFRent": startOFRent,
        "endOFRent": endOFRent,
        "rentType": rentType,
      };
}
