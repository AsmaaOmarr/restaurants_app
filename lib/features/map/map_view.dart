import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';

import 'package:mobile_assignment_1/features/map/widgets/map_view_body.dart';

class MapView extends StatelessWidget {
  final List<Restaurant> restaurantsList;
  const MapView({super.key, required this.restaurantsList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapViewBody(
        coordinates: extractCoordinates(restaurantsList), // San Francisco, USA
        // Add more coordinates here
      ),
    );
  }

  List<LatLng> extractCoordinates(List<Restaurant> restaurantsList) {
    return restaurantsList.map((restaurant) {
      double latitude = double.parse(restaurant.latitude!);
      double longitude = double.parse(restaurant.longitude!);
      return LatLng(latitude, longitude);
    }).toList();
  }
}
