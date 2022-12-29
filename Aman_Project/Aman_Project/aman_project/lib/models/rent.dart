class Rents {
  int docId;
  int rentPrice;
  String type;
  int area;
  int floor;
  String lessorName;
  String lessorNum;
  String tenantName;
  String tenantNum;
  String description;
  String furnished;
  String finishing;
  String tor;
  String torEnd;
  String startOFRent;
  String endOFRent;
  Rents({
    required this.docId,
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
  });
}
