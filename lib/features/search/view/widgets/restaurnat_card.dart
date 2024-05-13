import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/distance/view/distance_view.dart';
import 'package:mobile_assignment_1/features/distance_directions/views/distance_directions_view.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DistanceDirectionsView(restaurant: restaurant),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Constant.kLightMain),
            color: Colors.yellow.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  restaurant.imageUrl ?? "",
                  width: 100,
                  height: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          restaurant.name ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          restaurant.address ?? "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "📍 ${restaurant.city} ,${restaurant.country}",
                          ),
                          buildRatingStars(restaurant.starCount ?? 0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRatingStars(double rating) {
    int fullStars = rating.floor();
    double halfStars = rating - fullStars;
    int emptyStars = 5 - fullStars - (halfStars > 0 ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
            fullStars,
            (index) => const Icon(
              CupertinoIcons.star_fill,
              color: Colors.yellow,
              size: 16,
            ),
          ) +
          (halfStars > 0
              ? [
                  const Icon(
                    CupertinoIcons.star_lefthalf_fill,
                    color: Colors.yellow,
                    size: 16,
                  ),
                ]
              : []) +
          List.generate(
            emptyStars,
            (index) => Icon(
              CupertinoIcons.star_fill,
              color: Colors.grey.shade200,
              size: 16,
            ),
          ),
    );
  }
}
