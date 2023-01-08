import 'package:aman_project/data/image_management.dart';
import 'package:aman_project/data/property_managemnt.dart';
import 'package:aman_project/data/repositories/user_providers.dart';
import 'package:aman_project/models/property.dart';
import 'package:aman_project/models/rent.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';
import 'package:sqflite/sqflite.dart';

import '../shared_features/custom_message.dart';
import '../../constants/globals.dart' as val;

class RentsDescription extends ConsumerStatefulWidget {
  const RentsDescription({super.key});

  @override
  ConsumerState<RentsDescription> createState() => _RentsDescriptionState();
}

class _RentsDescriptionState extends ConsumerState<RentsDescription> {
  @override
  @override
  Widget build(BuildContext context) {
    Rents routeArgs = ModalRoute.of(context)!.settings.arguments as Rents;
    final userData = ref.watch(newUserDataProivder);

    Size size = MediaQuery.of(context).size;
    var defaultShadow = Shadow(
      color: Colors.black,
      offset: Offset.fromDirection(1.5, 3),
      blurRadius: 2,
    );
    bool isVisible = false;
    if (userData?.role == 'admin') {
      setState(() {
        isVisible = true;
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Hero(
                      tag: "property.singleImage",
                      child: Container(
                        height: size.height * 0.4,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          image: DecorationImage(
                            // image: NetworkImage(mainImage),
                            image: AssetImage("assets/images/1.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(30),
                              bottomRight: Radius.circular(30),
                            ),
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                stops: const [
                                  0.5,
                                  1.0,
                                ],
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ]),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      // height: size.height * 0.2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: MediaQuery.of(context).size.height / 34,
                            ),
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
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.black,
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
                                  routeArgs.type,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            child: Container(
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
                                  routeArgs.rentType,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical:
                                  MediaQuery.of(context).size.height * 0.01,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                strokeWidget(routeArgs.lessorName, 32),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 24, right: 24, top: 8, bottom: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      shadows: [defaultShadow],
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    strokeWidget(routeArgs.tenantNum, 16),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Icon(
                                      Icons.zoom_out_map,
                                      shadows: [defaultShadow],
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    strokeWidget("${routeArgs.area} sq/m", 16),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    strokeWidget(
                                        r"$" + routeArgs.rentPrice.toString(),
                                        16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: NoGlowScroll(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    routeArgs.tenantName,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "Property Owner",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey[500],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.phone,
                                    color: Theme.of(context).primaryColor,
                                    size: 20,
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
                            buildFeature(Icons.date_range,
                                routeArgs.endOFRent.toString(), "End Of Rent"),
                            buildFeature(
                                Icons.date_range,
                                routeArgs.startOFRent.toString(),
                                "Start Of Rent"),
                            buildFeature(Icons.date_range,
                                routeArgs.tor.toString(), "Time Of Rent"),
                            buildFeature(
                                Icons.date_range,
                                routeArgs.torEnd.toString(),
                                "End Time Of Rent"),
                            buildFeature(
                                Icons.house, routeArgs.furnished, "Furnished"),
                            buildFeature(
                                Icons.stairs, routeArgs.floor, "Floor"),
                            buildFeature(Icons.domain_outlined,
                                routeArgs.finishing, "Finishing"),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 24, left: 24, bottom: 24),
                      child: Text(
                        routeArgs.description,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, bottom: 24),
                      child: Text(
                        "Photos",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 26),
                      child: Container(
                        height: 200,
                        child: ListView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          // children: buildPhotos(routeArgs.),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVisible,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Delete"),
                                content: const Text(
                                    "Are you sure you would like to delete this property? "),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor:
                                          Theme.of(context).focusColor,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      'CANCEL',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // PropertyManagement.deleteProduct(
                                      //     routeArgs.docId!);
                                      // Navigator.pushReplacementNamed(
                                      //     context, '/home');
                                      // goodMessageSnackBar("Success",
                                      //     "Successfully deleted property!");
                                      // ScaffoldMessenger.of(context)
                                      //   ..hideCurrentSnackBar()
                                      //   ..showSnackBar(val.snackBar);
                                    },
                                    style: TextButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      'YES',
                                      style: TextStyle(
                                          color: Theme.of(context).errorColor),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Theme.of(context).errorColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Delete",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
                routeArgs = value as Rents;

                setState(() {});
              });
            },
          ),
        ),
      ),
    );
  }

  Stack strokeWidget(String text, double size) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            // color: Colors.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = const Color.fromARGB(255, 41, 39, 39),
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: size,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildFeature(IconData iconData, String? text, String aboveText) {
    if (text != null) {
      if (text.isNotEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  aboveText,
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Icon(
                  iconData,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        );
      } else {
        return const SizedBox();
      }
    } else {
      return const SizedBox();
    }
  }

  List<Widget> buildPhotos(List<dynamic> images) {
    List<Widget> list = [];

    list.add(
      const SizedBox(
        width: 24,
      ),
    );

    for (var i = 0; i < images.length; i++) {
      list.add(buildPhoto(images[i], i));
    }
    return list;
  }

  Widget buildPhoto(String url, int index) {
    return AspectRatio(
      aspectRatio: 3 / 2,
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          image: DecorationImage(
            image: CachedNetworkImageProvider(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
