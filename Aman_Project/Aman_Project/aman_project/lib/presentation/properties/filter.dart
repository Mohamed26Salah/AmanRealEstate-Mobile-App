import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Filter extends ConsumerStatefulWidget {
  const Filter({super.key});
  @override
  ConsumerState createState() => _FilterState();
}

class _FilterState extends ConsumerState<Filter> {
  //Final User Choice OF Filters
  String typeFilter = "";
  String roomFilter = "";
  String bathroomFilter = "";
  var priceSelectedRange = const RangeValues(10000, 10000000);
  var areaSelectedRange = const RangeValues(10, 3000);
///////////////////////////////////////////////////////////
  bool roomsButton1 = false;
  bool roomsButton2 = false;
  bool roomsButton3 = false;
  bool roomsButton4 = false;
  bool roomsButton5 = false;
  void updateButtonsUIRooms(int id) {
    roomsButton1 = false;
    roomsButton2 = false;
    roomsButton3 = false;
    roomsButton4 = false;
    roomsButton5 = false;
    switch (id) {
      case 1:
        roomsButton1 = true;
        roomFilter = "1";
        break;
      case 2:
        roomsButton2 = true;
        roomFilter = "2";
        break;
      case 3:
        roomsButton3 = true;
        roomFilter = "3";
        break;
      case 4:
        roomsButton4 = true;
        roomFilter = "4";
        break;
      case 5:
        roomsButton5 = true;
        roomFilter = "Any";
        break;
      default:
    }
    setState(() {});
  }

  //Bathrooms
  bool bathroomButton5 = false;
  bool bathroomButton6 = false;
  bool bathroomButton7 = false;
  bool bathroomButton8 = false;
  bool bathroomButton9 = false;
  void updateButtonsUIBathroom(int id) {
    bathroomButton5 = false;
    bathroomButton6 = false;
    bathroomButton7 = false;
    bathroomButton8 = false;
    bathroomButton9 = false;
    switch (id) {
      case 5:
        bathroomButton5 = true;
        bathroomFilter = "1";
        break;
      case 6:
        bathroomButton6 = true;
        bathroomFilter = "2";
        break;
      case 7:
        bathroomButton7 = true;
        bathroomFilter = "3";
        break;
      case 8:
        bathroomButton8 = true;
        bathroomFilter = "4";
        break;
      case 9:
        bathroomButton9 = true;
        bathroomFilter = "Any";
        break;
      default:
    }
    setState(() {});
  }

//Types
  bool flatButton10 = false;
  bool villaButton11 = false;
  bool buildingButton12 = false;
  bool storeButton13 = false;
  bool clinicButton14 = false;
  bool farmButton15 = false;
  bool factoryButton16 = false;
  bool landButton17 = false;
  bool otherButton18 = false;
  void updateButtonsUIType(id) {
    flatButton10 = false;
    villaButton11 = false;
    buildingButton12 = false;
    storeButton13 = false;
    clinicButton14 = false;
    farmButton15 = false;
    factoryButton16 = false;
    landButton17 = false;
    otherButton18 = false;
    switch (id) {
      case 10:
        flatButton10 = true;
        typeFilter = "Flat";
        break;
      case 11:
        villaButton11 = true;
        typeFilter = "Villa";
        break;
      case 12:
        buildingButton12 = true;
        typeFilter = "Building";
        break;
      case 13:
        storeButton13 = true;
        typeFilter = "Store";
        break;
      case 14:
        clinicButton14 = true;
        typeFilter = "Clinic";
        break;
      case 15:
        farmButton15 = true;
        typeFilter = "Farm";
        break;
      case 16:
        factoryButton16 = true;
        typeFilter = "Factory";
        break;
      case 17:
        landButton17 = true;
        typeFilter = "Land";
        break;
      case 18:
        otherButton18 = true;
        typeFilter = "Other";
        break;
      default:
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 24, left: 24, top: 32, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text(
                "Filter",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "your search",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: const [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "range",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: priceSelectedRange,
            onChanged: (RangeValues newPriceRange) {
              setState(() {
                priceSelectedRange = newPriceRange;
              });
            },
            min: 10000,
            max: 10000000,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${priceSelectedRange.start.ceil()}LE",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "${priceSelectedRange.end.ceil()}LE",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Text(
                "Area",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "range",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          RangeSlider(
            values: areaSelectedRange,
            onChanged: (RangeValues newAreaRange) {
              setState(() {
                areaSelectedRange = newAreaRange;
              });
            },
            min: 10,
            max: 3000,
            activeColor: Theme.of(context).primaryColor,
            inactiveColor: Colors.grey[300],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${areaSelectedRange.start.ceil()}sq/m",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
              Text(
                "${areaSelectedRange.end.ceil()}sq/m",
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Text(
            "Type",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          buildOption("Flat", flatButton10, 10),
                          buildOption("Villa", villaButton11, 11),
                          buildOption("Building", buildingButton12, 12),
                          buildOption("Store", storeButton13, 13),
                          buildOption("Clinic", clinicButton14, 14),
                          buildOption("Farm", farmButton15, 15),
                          buildOption("Factory", factoryButton16, 16),
                          buildOption("Land", landButton17, 17),
                          buildOption("Other", otherButton18, 18),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 28,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 16,
          ),
          const Text(
            "Rooms",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          buildOption("1", roomsButton1, 1),
                          buildOption("2", roomsButton2, 2),
                          buildOption("3", roomsButton3, 3),
                          buildOption("4", roomsButton4, 4),
                          buildOption("Any", roomsButton5, 5),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 28,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            "Bathrooms",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          const SizedBox(
                            width: 7,
                          ),
                          buildOption("1", bathroomButton5, 5),
                          buildOption("2", bathroomButton6, 6),
                          buildOption("3", bathroomButton7, 7),
                          buildOption("4", bathroomButton8, 8),
                          buildOption("Any", bathroomButton9, 9),
                          const SizedBox(
                            width: 7,
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 28,
                          decoration: const BoxDecoration(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  ref.read(filterPriceProivder.notifier).state =
                      priceSelectedRange;
                  ref.read(filterTypeProivder.notifier).state = typeFilter;
                  ref.read(filterRoomProivder.notifier).state = roomFilter;
                  ref.read(filterBathroomProivder.notifier).state =
                      bathroomFilter;
                  ref.read(filterAreaProivder.notifier).state =
                      areaSelectedRange;
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Filter",
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOption(String text, bool selected, int id) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: GestureDetector(
        onTap: () {
          if (id <= 5) {
            updateButtonsUIRooms(id);
          } else if (id > 5 && id <= 9) {
            updateButtonsUIBathroom(id);
          } else {
            updateButtonsUIType(id);
          }
        },
        child: Container(
          height: 45,
          width: 65,
          decoration: BoxDecoration(
              color: selected
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                width: selected ? 0 : 1,
                color: Colors.grey,
              )),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
