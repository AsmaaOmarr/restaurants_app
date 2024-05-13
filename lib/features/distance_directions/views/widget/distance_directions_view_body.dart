import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DistanceDirectionsViewBody extends StatefulWidget {
  final LatLng destination;

  const DistanceDirectionsViewBody({Key? key, required this.destination})
      : super(key: key);

  @override
  State<DistanceDirectionsViewBody> createState() =>
      _DistanceDirectionsViewBodyState();
}

class _DistanceDirectionsViewBodyState
    extends State<DistanceDirectionsViewBody> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition egypt = CameraPosition(
    target: LatLng(30.044420, 31.235712),
    zoom: 13,
  );
  Set<Marker> markers = {};
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: egypt,
        markers: markers,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    // Add markers
    _addMarker(
      LatLng(30.044420, 31.235712),
      "Egypt",
      BitmapDescriptor.defaultMarker,
    );
    _addMarker(
      widget.destination,
      "Destination",
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    );

    // Calculate distance and directions
    _getDistanceAndDirections(widget.destination);
  }

  void _addMarker(
      LatLng position, String markerId, BitmapDescriptor descriptor) {
    final Marker marker = Marker(
      markerId: MarkerId(markerId),
      position: position,
      icon: descriptor,
    );
    setState(() {
      markers.add(marker);
    });
  }

  Future<void> _getDistanceAndDirections(LatLng destination) async {
    final String apiKey = "AIzaSyCVsejMJffVaBZbaKkkquWRosmq19v4qn0";
    final String origin = "CURRENT_LOCATION_LAT,CURRENT_LOCATION_LNG";
    final String destinationLatLng =
        "${destination.latitude},${destination.longitude}";
    final String url =
        "https://maps.googleapis.com/maps/api/distancematrix/json?"
        "origins=$origin"
        "&destinations=$destinationLatLng"
        "&key=$apiKey";

    final response = await http.get(Uri.parse(url));
    final data = json.decode(response.body);

    final distance = data['rows'][0]['elements'][0]['distance']['text'];
    final duration = data['rows'][0]['elements'][0]['duration']['text'];

    print("Distance: $distance");
    print("Duration: $duration");

    // Add direction polyline
    _addDirectionPolyline(destination);
  }

  void _addDirectionPolyline(LatLng destination) {
    // You can implement polyline for directions here
    // You'll need to use the Google Maps Directions API
  }
}
