import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewBody extends StatefulWidget {
  const MapViewBody({super.key});

  @override
  State<MapViewBody> createState() => _MapViewBodyState();
}

class _MapViewBodyState extends State<MapViewBody> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition egypt = CameraPosition(
    target: LatLng(30.044420, 31.235712),
    zoom: 13,
  );
  List<Marker> markers = [
    const Marker(
      markerId: MarkerId('1'),
      position: LatLng(30.044420, 31.235712),
      infoWindow: InfoWindow(title: 'Egypt'),
    ),
  ];

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GoogleMap(
        onTap: (LatLng latLng) {
          print("===============");
          print(latLng);
          print("===============");
        },
        markers: markers.toSet(),
        mapType: MapType.normal,
        initialCameraPosition: egypt,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
