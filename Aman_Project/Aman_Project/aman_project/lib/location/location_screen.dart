import 'dart:async';
import 'dart:collection';

import 'package:aman_project/main.dart';
import 'package:flutter/material.dart';
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
    return WillPopScope(
      onWillPop: () async {
        // await Future.delayed(const Duration(milliseconds: 3000));

        Timer(Duration(seconds: 2), () {
          return Navigator.pop(context);
        });
        return false;
      },
      child: SafeArea(
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
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        // await Future.delayed(
                        //     const Duration(milliseconds: 3000));
                        // Navigator.pop(context);
                        Timer(Duration(seconds: 2), () {
                          Navigator.pop(context);
                        });
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 30,
                      ),
                    ),
                    Text(
                      'Company Location',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
