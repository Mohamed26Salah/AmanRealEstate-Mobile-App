// import '../models/property.dart';

import '../models/rents.dart';

// final DUMMY_PROPERTIES = [
//   Property(
//     id: '1',
//     label: "SALE",
//     name: "Akoya Compound",
//     price: "3,555.00",
//     location: "New Cairo",
//     sqm: "2,456",
//     review: "4.4",
//     description:
//         "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
//     frontImage: "assets/images/house_01.jpg",
//     ownerImage: "assets/images/owner.jpg",
//     ownerName: "Mohamed Salah",
//     floor: "4th Floor",
//     bedroom: '2 Bedrooms',
//     bathroom: '3 Bathrooms',
//     kitchen: '1 Kitchen',
//     images: [
//       "assets/images/kitchen.jpg",
//       "assets/images/bath_room.jpg",
//       "assets/images/swimming_pool.jpg",
//       "assets/images/bed_room.jpg",
//       "assets/images/living_room.jpg",
//     ],
//   ),
//   Property(
//     id: '2',
//     label: "RENT",
//     name: "Artal Home",
//     price: "3,500.00",
//     location: "El-Lotus",
//     sqm: "3,300",
//     review: "4.6",
//     description:
//         "The living is easy in this impressive, generously proportioned contemporary residence with lake and ocean views, located within a level stroll to the sand and surf.",
//     frontImage: "assets/images/house_04.jpg",
//     ownerImage: "assets/images/owner.jpg",
//     ownerName: "Youssef Alaa",
//     floor: "2nd Floor",
//     bedroom: '4 Bedrooms',
//     bathroom: '3 Bathrooms',
//     kitchen: '2 Kitchen',
//     images: [
//       "assets/images/kitchen.jpg",
//       "assets/images/bath_room.jpg",
//       "assets/images/swimming_pool.jpg",
//       "assets/images/bed_room.jpg",
//       "assets/images/living_room.jpg",
//     ],
//   ),
// ];

final DUMMY_RENTS = [
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
