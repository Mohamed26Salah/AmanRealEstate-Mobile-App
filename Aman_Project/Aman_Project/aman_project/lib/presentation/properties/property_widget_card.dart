import 'package:aman_project/common_widgets/extracted_widgets.dart';
import 'package:aman_project/models/property.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

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
    var defaultShadow = Shadow(
      color: Colors.black,
      offset: Offset.fromDirection(1.5, 3),
      blurRadius: 2,
    );
    // print(mainImage);
    return Hero(
      tag: property.docId.toString(),
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
                        property.type.tr,
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
                        property.offered.tr,
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
                              child: ExtractedWidgets()
                                  .strokeWidget(property.unitName, 18),
                            ),
                          ),
                          ExtractedWidgets().strokeWidget(
                              property.price.toString() + r" LE", 18),
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
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            shadows: [defaultShadow],
                            size: 14,
                          ),
                          // const SizedBox(
                          //   width: 4,
                          // ),
                          Flexible(
                            child: Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: ExtractedWidgets()
                                    .strokeWidget(property.addressUser, 14)),
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
                          // const SizedBox(
                          //   width: 4,
                          // ),
                          ExtractedWidgets()
                              .strokeWidget('${property.area} ${'sqm'.tr}', 14),
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
