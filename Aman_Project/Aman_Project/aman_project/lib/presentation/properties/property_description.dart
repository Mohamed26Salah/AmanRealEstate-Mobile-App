import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/repositories/properties_provider.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';
import 'package:sqflite/sqflite.dart';

import '../../common_widgets/extracted_widgets.dart';

class Details extends ConsumerStatefulWidget {
  // final Property? property;
  const Details({
    super.key,
    /*@required this.property */
  });

  @override
  ConsumerState<Details> createState() => _DetailsState();
}

class _DetailsState extends ConsumerState<Details> {
  late Database _database;
  bool isFavorite = false;
  late List<Map<String, dynamic>> _favorites;
  @override
  void initState() {
    _openDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Property routeArgs = ModalRoute.of(context)!.settings.arguments as Property;
    final userData = ref.watch(newUserDataProivder);
    Future<bool> checkFavorite(String id) async {
      await _openDatabase();
      String whereString = "`propid` = ? and `email`= ?";

      if (userData != null) {
        List<dynamic> whereArguments = [id, userData.email];
        try {
          var check = await _database.query("favs",
              columns: ['propid'],
              where: whereString,
              whereArgs: whereArguments);

          return check.isNotEmpty ? true : false;
        } catch (e) {
          return false;
        }
      } else {
        return false;
      }
    }

    void additem(Property item) async {
      if (userData != null) {
        Map<String, dynamic> row = {
          "propid": item.docId,
          "email": userData.email
        };
        try {
          await _database.insert("favs", row);
          var temp = ref.watch(whishlistProvider);
          temp.add(item);
          ref.read(whishlistProvider.notifier).state = temp.toList();
        } catch (e) {
          print(e);
        }
      } else {}
    }

    void removeitem(Property item) async {
      String whereString = "`propid` = ? and `email`= ?";
      if (userData != null) {
        List<dynamic> whereArguments = [item.docId, userData.email];
        try {
          await _database.delete("favs",
              where: whereString, whereArgs: whereArguments);
          var temp = ref.watch(whishlistProvider);
          temp.remove(item);
          ref.read(whishlistProvider.notifier).state = temp.toList();
        } catch (e) {
          print(e);
        }
      } else {}
    }

    Orientation screenLandscape = MediaQuery.of(context).orientation;
    var sizeLandscape = MediaQuery.of(context).size.height;

    if (screenLandscape == Orientation.landscape) {
      sizeLandscape *= 0.8;
    } else {
      sizeLandscape *= 0.4;
    }

    Color offeredColor;
    routeArgs.offered == 'For Rent'
        ? offeredColor = Theme.of(context).errorColor
        : offeredColor = Theme.of(context).primaryColor;

    Color visible;
    routeArgs.visible == 'Yes'
        ? visible = Theme.of(context).splashColor
        : visible = Theme.of(context).errorColor;

    Size size = MediaQuery.of(context).size;
    var defaultShadow = Shadow(
      color: Colors.black,
      offset: Offset.fromDirection(1.5, 3),
      blurRadius: 2,
    );
    bool isVisible = false;
    if (userData?.role == 'admin' || userData?.role == 'moderator') {
      setState(() {
        isVisible = true;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: NoGlowScroll(
          child: ListView(
            children: [
              Hero(
                tag: routeArgs.docId.toString(),
                child: Card(
                  margin: const EdgeInsets.only(bottom: 24),
                  clipBehavior: Clip.antiAlias,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                  child: Container(
                    height: sizeLandscape,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            CachedNetworkImageProvider(routeArgs.singleImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: const BoxDecoration(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                Visibility(
                                  visible: isVisible,
                                  child: Icon(
                                    Icons.remove_red_eye_rounded,
                                    color: visible,
                                    size: 30,
                                    shadows: [defaultShadow],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            width: 80,
                            padding: const EdgeInsets.symmetric(
                              vertical: 4,
                            ),
                            child: Center(
                              child: Text(
                                routeArgs.type.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: offeredColor,
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
                                routeArgs.offered.tr,
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
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              FutureBuilder(
                                future: checkFavorite(routeArgs.docId!),
                                builder: (contextt, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else {
                                    return InkWell(
                                      onTap: () {
                                        _openDatabase();
                                        if (snapshot.data!) {
                                          removeitem(routeArgs);
                                        } else {
                                          additem(routeArgs);
                                        }
                                        setState(() {});
                                      },
                                      child: Container(
                                        height: 45,
                                        width: 45,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            snapshot.data!
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 5),
                                      child: ExtractedWidgets()
                                          .strokeWidget(routeArgs.unitName, 18),
                                    ),
                                  ),
                                  ExtractedWidgets().strokeWidget(
                                      r"$" + routeArgs.price.toString(), 18),
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    shadows: [defaultShadow],
                                    size: 14,
                                  ),
                                  Flexible(
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: ExtractedWidgets().strokeWidget(
                                            routeArgs.addressUser, 14)),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Icon(
                                    Icons.zoom_out_map,
                                    color: Colors.white,
                                    shadows: [defaultShadow],
                                    size: 16,
                                  ),
                                  ExtractedWidgets().strokeWidget(
                                      '${routeArgs.area} ${'sqm'.tr}', 14),
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
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 24, left: 24, right: 24, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Owner Number".tr,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 19,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.3),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                ExtractedWidgets.makePhoneCallProperty(
                                    context: context,
                                    isVisible: isVisible,
                                    routeArgs: routeArgs,
                                    ref: ref);
                              },
                              child: Icon(
                                Icons.phone,
                                color: Theme.of(context).primaryColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24),
                child: SizedBox(
                  height: 100,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      ExtractedWidgets().buildFeature(
                          Icons.hotel, routeArgs.noRooms, "Rooms".tr, context),
                      ExtractedWidgets().buildFeature(Icons.bathtub_outlined,
                          routeArgs.noBathrooms, "Barthrooms".tr, context),
                      ExtractedWidgets().buildFeature(Icons.apartment_rounded,
                          routeArgs.noFlats, "Flats".tr, context),
                      ExtractedWidgets().buildFeature(Icons.house,
                          routeArgs.furnished!.tr, "Furnished".tr, context),
                      ExtractedWidgets().buildFeature(
                          Icons.stairs, routeArgs.floor, "Floor".tr, context),
                      ExtractedWidgets().buildFeature(
                          Icons.local_activity,
                          routeArgs.typeOFActivity,
                          "Type Of Activity".tr,
                          context),
                      ExtractedWidgets().buildFeature(
                          Icons.business_outlined,
                          routeArgs.theNumberOFAB,
                          "Adminstrative Building".tr,
                          context),
                      ExtractedWidgets().buildFeature(Icons.domain_outlined,
                          routeArgs.finishing!.tr, "Finishing".tr, context),
                      ExtractedWidgets().buildFeature(Icons.stairs,
                          routeArgs.doublex, "Doublex".tr, context),
                      ExtractedWidgets().buildFeature(Icons.priority_high,
                          routeArgs.priority.tr, "Priority".tr, context),
                      ExtractedWidgets().buildFeature(Icons.attach_money,
                          routeArgs.paymentMethod.tr, "Payment".tr, context),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
                child: Text(
                  'Owner Name'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Text(
                  routeArgs.ownerName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
                child: Text(
                  "Unit Name".tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Text(
                  routeArgs.unitName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 16),
                child: Text(
                  "Price".tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Text(
                  r"$" + routeArgs.price.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[500],
                  ),
                ),
              ),
              ExtractedWidgets()
                  .propertyDetailsDescriptionAndAddress(routeArgs, isVisible),
              Padding(
                padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
                child: Text(
                  "Photos".tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 26, left: 24),
                child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: routeArgs.multiImages.length,
                    itemBuilder: (context, index) {
                      return ExtractedWidgets()
                          .buildPhoto(routeArgs.multiImages[index]);
                    },
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                  ),
                ),
              ),
              ExtractedWidgets().deleteButton(
                  isVisible: isVisible,
                  context: context,
                  routeArgsProperty: routeArgs,
                  type: 'property'),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: isVisible,
          child: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.of(context)
                  .pushNamed('/editProperty', arguments: routeArgs)
                  .then((value) {
                ImageManagement().clearImageProivders(ref);
                routeArgs = (value ?? routeArgs) as Property;

                setState(() {});
              });
            },
          ),
        ),
      ),
    );
  }

  Future _openDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = "${databasesPath}favs.db";
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE favs (id INTEGER PRIMARY KEY AUTOINCREMENT, propid TEXT , email TEXT,CONSTRAINT propid_uniqe UNIQUE (propid,email))');
      },
    );
  }
}
