import 'package:aman_project/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

// final userRoleProvider = FutureProvider((ref) async {
//   return await UserHelper().getUser();
// });

class PropertyWidget extends StatelessWidget {
  String addressAdmin;
  String addressUser;
  String area;
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
  String price;
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
  final CacheManager cacheManager = CacheManager(Config('images_key',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 1)));
  PropertyWidget({
    super.key,
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
    required this.singleImage,
    required this.multiImages,
    //UnCommon
    this.doublex,
    this.floor,
    this.furnished,
    this.finishing,
    this.noBarthrooms,
    this.noFlats,
    this.noFloors,
    this.noRooms,
    this.theNumberOFAB,
    this.typeOFActivity,
  });

  @override
  Widget build(BuildContext context) {
    // print(mainImage);
    return Hero(
      tag: "assets/images/house_01.jpg",
      child: GestureDetector(
        // onTap: () => selectedProperty(context),
        child: Card(
          margin: const EdgeInsets.only(bottom: 24),
          clipBehavior: Clip.antiAlias,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Container(
            height: 210,
            decoration: BoxDecoration(
              image: DecorationImage(
                // image: NetworkImage(mainImage),
                image: CachedNetworkImageProvider(singleImage,
                    cacheManager: cacheManager),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow[700],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    width: 80,
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                    ),
                    child: Center(
                      child: Text(
                        "FOR Sale",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            unitName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            r"$" + price,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: Colors.white,
                                size: 14,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                addressAdmin,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(
                                Icons.zoom_out_map,
                                color: Colors.white,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                "$area sq/m",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
