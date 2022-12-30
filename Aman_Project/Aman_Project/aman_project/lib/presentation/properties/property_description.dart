import 'package:aman_project/models/property.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:no_glow_scroll/no_glow_scroll.dart';

class Details extends StatefulWidget {
  // final Property? property;
  const Details({
    super.key,
    /*@required this.property */
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    Property routeArgs = ModalRoute.of(context)!.settings.arguments as Property;

    Color offeredColor;
    routeArgs.offered == 'For Rent'
        ? offeredColor = Colors.red
        : offeredColor = Colors.yellow[700]!;

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Stack(
                children: [
                  Hero(
                    tag: routeArgs.singleImage,
                    child: Container(
                      height: size.height * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          image:
                              CachedNetworkImageProvider(routeArgs.singleImage),
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
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 48,
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
                        // Expanded(
                        //   child: Container(),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 8,
                          ),
                          child: Container(
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
                                routeArgs.offered,
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
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                routeArgs.unitName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // const Text(
                              //   "24\$",
                              //   style: TextStyle(
                              //     color: Colors.white,
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.yellow[700],
                                    size: 20,
                                  ),
                                ),
                              ),
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
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    routeArgs.addressUser,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
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
                                    "${routeArgs.area} sq/m}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    r"$" + routeArgs.price.toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
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
                                    routeArgs.ownerName,
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
                                  color: Colors.yellow[700]?.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.phone,
                                    color: Colors.yellow[700],
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
                            buildFeature(Icons.hotel, routeArgs.noRooms , "Rooms"),
                            buildFeature(
                                Icons.bathtub_outlined, routeArgs.noBarthrooms ,"Barthrooms"),
                            buildFeature(
                                Icons.apartment_rounded, routeArgs.noFlats , "Flats"),
                            buildFeature(Icons.house, routeArgs.furnished , "Furnished"),
                            buildFeature(Icons.stairs, routeArgs.floor , "Floor"),
                            buildFeature(
                                Icons.local_activity, routeArgs.typeOFActivity , "Type Of Activity"),
                            buildFeature(Icons.business_outlined,
                                routeArgs.theNumberOFAB , "Adminstrative Building"),
                            buildFeature(
                                Icons.domain_outlined, routeArgs.finishing , "Finishing"),
                            buildFeature(Icons.stairs, routeArgs.doublex , "Doublex"),
                            buildFeature(Icons.priority_high, routeArgs.priority , "Priority"),
                           
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
                      child: Text(
                        "Description For User",
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
                        routeArgs.addressUser,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[500],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
                      child: Text(
                        "Description For Admin",
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
                        routeArgs.addressAdmin,
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
                          children: buildPhotos(routeArgs.multiImages),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.edit),
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/editProperty', arguments: routeArgs);
          },
        ),
      ),
    );
  }

  Widget buildFeature(IconData iconData, String? text , String aboveText) {
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
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(height: 5,),
                Icon(
                  iconData,
                  color: Colors.yellow[700],
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
            )
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

  // void _showEditBottomSheet(BuildContext context, Property routeArgs) {
  //   showModalBottomSheet<dynamic>(
  //       context: context,
  //       isScrollControlled: true,
  //       shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.only(
  //           topLeft: Radius.circular(30),
  //           topRight: Radius.circular(30),
  //         ),
  //       ),
  //       builder: (BuildContext context) {
  //         return SizedBox(
  //           height: MediaQuery.of(context).size.height * 0.90,
  //           child: EditProperty(
  //             routeArgs: routeArgs,
  //           ),
  //         );
  //       });
  // }
}
