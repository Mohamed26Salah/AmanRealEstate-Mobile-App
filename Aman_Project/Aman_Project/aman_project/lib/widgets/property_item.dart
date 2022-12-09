import 'package:aman_project/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class PropertyItem extends StatelessWidget {
  final String documentID;

  PropertyItem({required this.documentID});

  @override
  Widget build(BuildContext context) {
    CollectionReference properties =
        FirebaseFirestore.instance.collection('properties');
    return FutureBuilder<DocumentSnapshot>(
      future: properties.doc(documentID).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return PropertyWidget(
              addressAdmin: data['AddressAdmin'],
              addressUser: data['AddressUser'],
              area: data['Area'],
              code: data['Code'],
              descriptionAdmin: data['DescriptionAdmin'],
              descriptionUser: data['DescriptionUser'],
              doublex: data['Doublex'],
              finishing: data['Finishing'],
              floor: data['Floor'],
              furnished: data['Furnished'],
              mainImage: data['MainImage'],
              name: data['Name'],
              noBarthrooms: data['No.Bathrooms'],
              noFlats: data['No.Flats'],
              noFloors: data['No.Floors'],
              noRooms: data['No.Rooms'],
              offered: data['Offered'],
              owner: data['Owner'],
              ownerNumber: data['OwnerNumber'],
              paymentMethod: data['PaymentMethod'],
              priority: data['Priority'],
              theNumberOFAB: data['TheNumberOFAB'],
              type: data['Type'],
              typeOFActivity: data['TypeOfActivity'],
              visible: data['Visible'],
              price: data['price']);
        }
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              child: const CircularProgressIndicator(
                value: null,
                strokeWidth: 7.0,
              ),
            ),
          ),
        );
      },
    );
  }
}

class PropertyWidget extends StatelessWidget {
  String addressAdmin;
  String addressUser;
  String area;
  String code;
  String descriptionAdmin;
  String descriptionUser;
  bool doublex;
  String finishing;
  String floor;
  bool furnished;
  String mainImage;
  String name;
  String noBarthrooms;
  String noFlats;
  String noFloors;
  String noRooms;
  bool offered;
  String owner;
  String ownerNumber;
  String paymentMethod;
  String priority;
  String theNumberOFAB;
  String type;
  String typeOFActivity;
  bool visible;
  String price;
  final CacheManager cacheManager = CacheManager(Config('images_key',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 1)));
  PropertyWidget({
    super.key,
    required this.addressAdmin,
    required this.addressUser,
    required this.area,
    required this.code,
    required this.descriptionAdmin,
    required this.descriptionUser,
    required this.doublex,
    required this.finishing,
    required this.floor,
    required this.furnished,
    required this.mainImage,
    required this.name,
    required this.noBarthrooms,
    required this.noFlats,
    required this.noFloors,
    required this.noRooms,
    required this.offered,
    required this.owner,
    required this.ownerNumber,
    required this.paymentMethod,
    required this.priority,
    required this.theNumberOFAB,
    required this.type,
    required this.typeOFActivity,
    required this.visible,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    print(mainImage);
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
                image: CachedNetworkImageProvider(mainImage,
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
                            name,
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
