import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../data/property_managemnt.dart';
import '../models/property.dart';
import '../presentation/shared_features/custom_message.dart';
import '../../constants/globals.dart' as val;

class ExtractedWidgets {
  Column propertyDetailsDescriptionAndAddress(
      Property routeArgs, bool isVisible) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.descriptionUser,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: const Padding(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
            child: Text(
              "Description For Admin",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Text(
              routeArgs.descriptionAdmin,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: const Padding(
            padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
            child: Text(
              "Address For Admin",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
            child: Text(
              routeArgs.addressAdmin,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(right: 24, left: 24, bottom: 16),
          child: Text(
            "Address For User",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
          child: Text(
            routeArgs.addressUser,
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[500],
            ),
          ),
        ),
      ],
    );
  }

  Stack strokeWidget(String text, double size) {
    return Stack(
      children: [
        Text(
          text,
          overflow: TextOverflow.ellipsis,
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
          overflow: TextOverflow.ellipsis,
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

  Widget buildFeature(
      IconData iconData, String? text, String aboveText, BuildContext context) {
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

  Visibility deleteButton(
      bool isVisible, BuildContext context, Property routeArgs) {
    return Visibility(
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
                      backgroundColor: Theme.of(context).focusColor,
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
                      PropertyManagement.deleteProduct(routeArgs.docId!);
                      Navigator.pushReplacementNamed(context, '/home');
                      goodMessageSnackBar(
                          "Success", "Successfully deleted property!");
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(val.snackBar);
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
                      style: TextStyle(color: Theme.of(context).errorColor),
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
    );
  }
}
