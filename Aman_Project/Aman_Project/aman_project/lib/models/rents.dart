class Rents {
  int id;
  String placeType;
  int area;
  String description;
  double rentPrice;
  bool furnished;
  int floor;
  String TOR;
  String TOREND;
  String Start_OF_Rent;
  String End_OF_Rent;
  int rentType;
  String lessorName;
  String tenantName;
  double lessorNum;
  double tenantNum;
  String code;
  Rents({
    required  this.id,
    required  this.placeType,
    required  this.area,
    required  this.description,
    required  this.rentPrice,
    required  this.furnished,
    required  this.floor,
    required  this.TOR,
    required  this.TOREND,
    required  this.Start_OF_Rent,
    required  this.End_OF_Rent,
    required  this.rentType,
    required  this.lessorName,
    required  this.tenantName,
    required  this.lessorNum,
    required  this.tenantNum,
    required  this.code,
  });
}