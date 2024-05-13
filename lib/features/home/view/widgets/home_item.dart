import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/resturant/view/resturant_view.dart';
import 'package:mobile_assignment_1/features/search/view/widgets/restaurnat_card.dart';

class HomeItem extends StatelessWidget {
  final Restaurant restaurant;

  const HomeItem({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantView(
              restaurantName: restaurant.name,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.yellow.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '${restaurant.imageUrl}',
                  width: 130,
                  height: 120,
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          ' ${restaurant.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Text(
                        "📍 ${restaurant.address} ${restaurant.city}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(children: [
                        buildRatingStars(restaurant.starCount ?? 0),
                        Flexible(
                            child: Text(
                          " (${restaurant.ratingCount})",
                        ))
                      ])
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
}
