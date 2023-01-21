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
  String priceFilter = "";
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
        roomFilter = "5";
        break;
      default:
    }
    setState(() {});
  }

  //Bathrooms
  bool bathroomButton6 = false;
  bool bathroomButton7 = false;
  bool bathroomButton8 = false;
  bool bathroomButton9 = false;
  bool bathroomButton10 = false;
  void updateButtonsUIBathroom(int id) {
    bathroomButton6 = false;
    bathroomButton7 = false;
    bathroomButton8 = false;
    bathroomButton9 = false;
    bathroomButton10 = false;
    switch (id) {
      case 6:
        bathroomButton6 = true;
        bathroomFilter = "1";
        break;
      case 7:
        bathroomButton7 = true;
        bathroomFilter = "2";
        break;
      case 8:
        bathroomButton8 = true;
        bathroomFilter = "3";
        break;
      case 9:
        bathroomButton9 = true;
        bathroomFilter = "4";
        break;
      case 10:
        bathroomButton10 = true;
        bathroomFilter = "5";
        break;
      default:
    }
    setState(() {});
  }

//Types
  bool flatButton11 = false;
  bool villaButton12 = false;
  bool buildingButton13 = false;
  bool storeButton14 = false;
  bool clinicButton15 = false;
  bool farmButton16 = false;
  bool factoryButton17 = false;
  bool landButton18 = false;
  bool otherButton19 = false;
  void updateButtonsUIType(id) {
    flatButton11 = false;
    villaButton12 = false;
    buildingButton13 = false;
    storeButton14 = false;
    clinicButton15 = false;
    farmButton16 = false;
    factoryButton17 = false;
    landButton18 = false;
    otherButton19 = false;
    switch (id) {
      case 11:
        flatButton11 = true;
        typeFilter = "Flat";
        break;
      case 12:
        villaButton12 = true;
        typeFilter = "Villa";
        break;
      case 13:
        buildingButton13 = true;
        typeFilter = "Building";
        break;
      case 14:
        storeButton14 = true;
        typeFilter = "Store";
        break;
      case 15:
        clinicButton15 = true;
        typeFilter = "Clinic";
        break;
      case 16:
        farmButton16 = true;
        typeFilter = "Farm";
        break;
      case 17:
        factoryButton17 = true;
        typeFilter = "Factory";
        break;
      case 18:
        landButton18 = true;
        typeFilter = "Land";
        break;
      case 19:
        otherButton19 = true;
        typeFilter = "Other";
        break;
      default:
    }
    setState(() {});
  }

  // Sorting Price Buttons
  bool ascendingButton20 = false;
  bool descendingButton21 = false;
  void updateButtonsUIPrice(id) {
    ascendingButton20 = false;
    descendingButton21 = false;
    switch (id) {
      case 20:
        ascendingButton20 = true;
        priceFilter = "LTH";
        break;
      case 21:
        descendingButton21 = true;
        priceFilter = "HTL";
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
            children: [
              Text(
                "Filter".tr,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                "your search".tr,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            "Price".tr,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildOption("Low To High".tr, ascendingButton20, 20),
              buildOption("High To Low".tr, descendingButton21, 21),
            ],
          ),
          Text(
            "Type".tr,
            style: const TextStyle(
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
                          buildOption("Flat".tr, flatButton11, 11),
                          buildOption("Villa".tr, villaButton12, 12),
                          buildOption("Building".tr, buildingButton13, 13),
                          buildOption("Store".tr, storeButton14, 14),
                          buildOption("Clinic".tr, clinicButton15, 15),
                          buildOption("Farm".tr, farmButton16, 16),
                          buildOption("Factory".tr, factoryButton17, 17),
                          buildOption("Land".tr, landButton18, 18),
                          buildOption("Other".tr, otherButton19, 19),
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
          Text(
            "Rooms".tr,
            style: const TextStyle(
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
                          buildOption("5", roomsButton5, 5),
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
          Text(
            "Bathrooms".tr,
            style: const TextStyle(
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
                          buildOption("1", bathroomButton6, 6),
                          buildOption("2", bathroomButton7, 7),
                          buildOption("3", bathroomButton8, 8),
                          buildOption("4", bathroomButton9, 9),
                          buildOption("5", bathroomButton10, 10),
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
                  ref.read(filterPriceProivder.notifier).state = priceFilter;
                  ref.read(filterTypeProivder.notifier).state = typeFilter;
                  ref.read(filterRoomProivder.notifier).state = roomFilter;
                  ref.read(filterBathroomProivder.notifier).state =
                      bathroomFilter;
                  ref.read(searchInputProivder.notifier).state = "";
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Filter".tr,
                  style: const TextStyle(
                    fontSize: 15,
                    letterSpacing: 2,
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
          } else if (id > 5 && id <= 10) {
            updateButtonsUIBathroom(id);
          } else if (id > 10 && id <= 19) {
            updateButtonsUIType(id);
          } else {
            updateButtonsUIPrice(id);
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
            child: FittedBox(
              fit: BoxFit.cover,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
