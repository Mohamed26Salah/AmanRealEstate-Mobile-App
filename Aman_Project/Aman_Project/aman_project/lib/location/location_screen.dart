import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  var myMarker = HashSet<Marker>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                setState(() {
                  myMarker.add(
                    const Marker(
                        markerId: MarkerId('1'),
                        position: LatLng(30.039918, 31.456704),
                        infoWindow: InfoWindow(
                          title: 'Aman Real Estate',
                          snippet: 'First Settelment 30.039918, 31.456704',
                        )),
                  );
                });
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(30.039918, 31.456704),
                zoom: 17,
              ),
              markers: myMarker,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              child: Text(
                'Company Location',
                style: TextStyle(
                  fontSize: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
