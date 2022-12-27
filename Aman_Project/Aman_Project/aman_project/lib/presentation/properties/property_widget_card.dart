import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final userRoleProvider = FutureProvider((ref) async {
//   return await UserHelper().getUser();
// });

class PropertyWidget extends StatelessWidget {
  Property property;

  Color? color = Colors.yellow[700];
  final CacheManager cacheManager = CacheManager(Config('images_key',
      maxNrOfCacheObjects: 100, stalePeriod: const Duration(days: 1)));

  PropertyWidget({
    super.key,
    required this.property,
  });

  selectedProperty(BuildContext context) {
    Navigator.of(context).pushNamed('/details', arguments: property);
  }

  @override
  Widget build(BuildContext context) {
    if (property.offered == "For Sale") {
      property.offered = "For Sale";
    } else {
      property.offered = "For Rent";
      color = Colors.red;
    }
    // print(mainImage);
    return Hero(
      tag: property.singleImage,
      child: GestureDetector(
        onTap: () => selectedProperty(context),
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
                image: CachedNetworkImageProvider(property.singleImage,
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
                        property.type,
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
                      color: color,
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
                        property.offered,
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
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                property.unitName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            r"$" + property.price.toString(),
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
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Row(
                          //   children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 14,
                          ),
                          // const SizedBox(
                          //   width: 4,
                          // ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                property.addressUser,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          const Icon(
                            Icons.zoom_out_map,
                            color: Colors.white,
                            size: 16,
                          ),
                          // const SizedBox(
                          //   width: 4,
                          // ),
                          Text(
                            "${property.area} sq/m",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          //   ],
                          // ),
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
