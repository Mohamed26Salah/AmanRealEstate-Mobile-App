class Property {
  String docId;
  String addressAdmin;
  String addressUser;
  int area;
  // String code;
  String descriptionAdmin;
  String descriptionUser;
  String unitName;
  String offered;
  String ownerName;
  String ownerNumber;
  String paymentMethod;
  String priority;
  String type;
  String visible;
  int price;
  List<dynamic> multiImages;
  String singleImage;
  //UnCommon
  String? doublex;
  String? finishing;
  String? floor;
  String? furnished;
  String? noBarthrooms;
  String? noFlats;
  String? noFloors;
  String? noRooms;
  String? theNumberOFAB;
  String? typeOFActivity;
  Property(
      {required this.docId,
      required this.addressAdmin,
      required this.addressUser,
      required this.area,
      required this.descriptionAdmin,
      required this.descriptionUser,
      required this.unitName,
      required this.offered,
      required this.ownerName,
      required this.ownerNumber,
      required this.paymentMethod,
      required this.priority,
      required this.type,
      required this.visible,
      required this.price,
      required this.multiImages,
      required this.singleImage,
      this.doublex,
      this.finishing,
      this.floor,
      this.furnished,
      this.noBarthrooms,
      this.noFlats,
      this.noFloors,
      this.noRooms,
      this.theNumberOFAB,
      this.typeOFActivity});
}
