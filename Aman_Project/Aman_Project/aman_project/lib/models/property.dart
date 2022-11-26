
class Property {
  String id;
  String label;
  String name;
  String price;
  String location;
  String sqm;
  String review;
  String description;
  String frontImage;
  String ownerImage;
  String ownerName;
  String floor;
  String bedroom;
  String bathroom;
  String kitchen;
  List<String> images;

  Property(
      {required this.id,
      required this.label,
      required this.name,
      required this.price,
      required this.location,
      required this.sqm,
      required this.review,
      required this.description,
      required this.frontImage,
      required this.ownerImage,
      required this.ownerName,
      required this.floor,
      required this.bedroom,
      required this.bathroom,
      required this.kitchen,
      required this.images}
      );
}