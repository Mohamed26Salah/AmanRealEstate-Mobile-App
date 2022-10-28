class Rents {
  int? id;
  String? placeType;
  int? area;
  String? description;
  double? rentPrice;
  bool? furnished;
  int? floor;
  String? TOR;
  String? TOREND;
  String? Start_OF_Rent;
  String? End_OF_Rent;
  int? rentType;
  String? lessorName;
  String? tenantName;
  double? lessorNum;
  double? tenantNum;
  String? code;
  Rents({
    required int this.id,
    required String this.placeType,
    required int this.area,
    required String this.description,
    required double this.rentPrice,
    required bool this.furnished,
    required int this.floor,
    required String this.TOR,
    required String this.TOREND,
    required String this.Start_OF_Rent,
    required String this.End_OF_Rent,
    required int this.rentType,
    required String this.lessorName,
    required String this.tenantName,
    required double this.lessorNum,
    required double this.tenantNum,
    required String this.code,
  });
}

List<Rents> getRentsList() {
  return <Rents>[
    Rents(
      id: 0,
      placeType: "Flat",
      area: 250,
      description: "Very Good",
      rentPrice: 2500,
      furnished: true,
      floor: 2,
      TOR: '2022 - 06 - 24',
      TOREND: '2022 - 07 - 22',
      Start_OF_Rent: '2022 - 07 - 22',
      End_OF_Rent: '2023 - 01 - 04',
      rentType: 2,
      lessorName: "Salah",
      tenantName: "Yonos",
      lessorNum: 01555134563,
      tenantNum: 01144413610,
      code: "A1",
    ),
    Rents(
      id: 1,
      placeType: "Flat",
      area: 350,
      description: "Very bad",
      rentPrice: 1500,
      furnished: false,
      floor: 1,
      TOR: '2022 - 05 - 04',
      TOREND: '2022 - 08 - 01',
      Start_OF_Rent: '2022 - 04 - 04',
      End_OF_Rent: '2023 - 04 - 04',
      rentType: 1,
      lessorName: "Youssef",
      tenantName: "Alaa",
      lessorNum: 01588844551,
      tenantNum: 01020304050,
      code: "A2",
    ),
    Rents(
      id: 2,
      placeType: "villa",
      area: 850,
      description: "Very Very Good",
      rentPrice: 7000,
      furnished: true,
      floor: 2,
      TOR: '2022 - 04 - 28',
      TOREND: '2022 - 06 - 26',
      Start_OF_Rent: '2022 - 02 - 28',
      End_OF_Rent: '2023 - 01 - 28',
      rentType: 3,
      lessorName: "Rania",
      tenantName: "Rowaida",
      lessorNum: 01144413608,
      tenantNum: 01144413610,
      code: "A3",
    ),
    Rents(
      id: 3,
      placeType: "villa",
      area: 950,
      description: "Very Very Good",
      rentPrice: 8000,
      furnished: true,
      floor: 2,
      TOR: '2022 - 06 - 03',
      TOREND: '2022 - 07 - 26',
      Start_OF_Rent: '2022 - 07 - 03',
      End_OF_Rent: '2022 - 06 - 04',
      rentType: 4,
      lessorName: "Hana",
      tenantName: "Rana",
      lessorNum: 01245687456,
      tenantNum: 01144413610,
      code: "A4",
    ),
    Rents(
      id: 4,
      placeType: "Flat",
      area: 150,
      description: "Very Very Good",
      rentPrice: 1000,
      furnished: true,
      floor: 5,
      TOR: '2022 - 05 - 04',
      TOREND: '2022 - 06 - 04',
      Start_OF_Rent: '2022 - 01 - 04',
      End_OF_Rent: '2022 - 4 - 04',
      rentType: 1,
      lessorName: "Hana",
      tenantName: "Rana",
      lessorNum: 01097262974,
      tenantNum: 01144413610,
      code: "A5",
    ),
    Rents(
      id: 5,
      placeType: "Flat",
      area: 400,
      description: "Very Very Good",
      rentPrice: 5000,
      furnished: true,
      floor: 2,
      TOR: '2022 - 11 - 10',
      TOREND: '2022 - 12 - 12',
      Start_OF_Rent: '2021 - 01 - 04',
      End_OF_Rent: '2023 - 4 - 04',
      rentType: 1,
      lessorName: "Farah",
      tenantName: "tasneem",
      lessorNum: 01097262974,
      tenantNum: 01144413610,
      code: "A6",
    )
  ];
}
