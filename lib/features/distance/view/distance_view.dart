import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/distance/cubit/distance_cubit.dart';
import 'widgets/distance_view_body.dart';

class DistanceView extends StatelessWidget {
  final Restaurant restaurant;
  const DistanceView({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          restaurant.name ?? "",
        ),
      ),
      body: BlocProvider(
        create: (context) => DistanceCubit()
          ..calculateDistance(
              restaurantLat: double.parse(restaurant.latitude!),
              restaurantLong: double.parse(restaurant.longitude!)),
        child: DistanceViewBody(
          restaurant: restaurant,
        ),
      ),
    );
  }
}
