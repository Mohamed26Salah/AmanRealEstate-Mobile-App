class Number {
  String Id;
  String name;
  String number;

  Number({required this.Id, required this.name, required this.number});
  Number.alternate({this.Id = '', this.name = '', this.number = ''});

  factory Number.fromJson(Map<String, dynamic> json, String id) => Number(
        Id: id,
        name: json["name"],
        number: json["number"],
      );
  Map<String, dynamic> toJson() => {"name": name, "number": number};
}
