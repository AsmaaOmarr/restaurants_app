import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewBody extends StatefulWidget {
  final List<LatLng> coordinates;

  const MapViewBody({Key? key, required this.coordinates}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GoogleMap(
        onTap: (LatLng latLng) {
          print("===============");
          print(latLng);
          print("===============");
        },
        markers: _createMarkers(),
        mapType: MapType.normal,
        initialCameraPosition: egypt,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Set<Marker> _createMarkers() {
    return widget.coordinates.map((latLng) {
      return Marker(
        markerId: MarkerId(latLng.toString()),
        position: latLng,
      );
    }).toSet();
  }
}
