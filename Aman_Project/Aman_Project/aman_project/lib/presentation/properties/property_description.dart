import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  // final Property? property;
  const Details({
    super.key,
    /*@required this.property */
  });

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final propertySingleImage = routeArgs['singleImage'] as String;
    final propertyType = routeArgs['type'] as String;
    final propertyUnitName = routeArgs['unitName'] as String;
    final propertyAddressUser = routeArgs['addressUser'] as String;
    final propertyArea = routeArgs['area'] as String;
    final propertyPrice = routeArgs['price'] as String;
    // final propertyOwnerImage = routeArgs['ownerImage'] as String;
    final propertyOwnerName = routeArgs['ownerName'] as String;
    final propertyDescriptionAdmin = routeArgs['descriptionAdmin'] as String;
    final propertyImages = routeArgs['multiImages'] as List<dynamic>;
    final propertyFloor = routeArgs['floor'] as String;

    print(propertyDescriptionAdmin);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Hero(
              tag: propertySingleImage,
              child: Container(
                height: size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(propertySingleImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
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
              height: size.height * 0.37,
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
                  Expanded(
                    child: Container(),
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
                          "FOR $propertyType",
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
                          propertyUnitName,
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
                              propertyAddressUser,
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
                              "$propertyArea sq/m",
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
                              r"$" + propertyPrice,
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //   // image: AssetImage(propertyOwnerImage),
                                    //   fit: BoxFit.cover, //FrontImage
                                    // ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      propertyOwnerName,
                                      style: TextStyle(
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 24, left: 24, bottom: 24),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  buildFeature(Icons.hotel, "3 Bedroom"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  buildFeature(Icons.wc, "2 Bathroom"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  buildFeature(Icons.kitchen, "1 Kitchen"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  buildFeature(Icons.house, "Furnished"),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  buildFeature(Icons.stairs, "$propertyFloor"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(right: 24, left: 24, bottom: 16),
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
                          propertyDescriptionAdmin,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.only(right: 24, left: 24, bottom: 24),
                        child: Text(
                          "Photos",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 26),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            children: buildPhotos(propertyImages),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeature(IconData iconData, String text) {
    return Column(
      children: [
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
    );
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
            image: AssetImage(url),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
