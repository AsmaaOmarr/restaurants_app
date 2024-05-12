import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/distance/cubit/distance_cubit.dart';

class DistanceViewBody extends StatelessWidget {
  final Restaurant restaurant;
  const DistanceViewBody({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Constant.kMainColor),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(restaurant.imageUrl ?? ""),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Address 📍",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${restaurant.address}\n${restaurant.city} ,${restaurant.country}",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Distance",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              BlocBuilder<DistanceCubit, DistanceState>(
                builder: (context, state) {
                  if (state is DistanceSuccess) {
                    return Text(
                      state.distance,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    );
                  }
                  return Text(
                    "Calculating....",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
