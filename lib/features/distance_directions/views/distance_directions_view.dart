import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';

import 'widget/distance_directions_view_body.dart';

class DistanceDirectionsView extends StatelessWidget {
  const DistanceDirectionsView({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DistanceDirectionsViewBody(
        destination: LatLng(
          double.parse(restaurant.latitude!),
          double.parse(restaurant.longitude!),
        ),
      ),
    );
  }
}
