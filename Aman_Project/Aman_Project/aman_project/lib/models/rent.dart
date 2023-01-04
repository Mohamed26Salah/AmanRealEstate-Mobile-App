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
