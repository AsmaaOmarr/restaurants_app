import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/resturant_view.dart';

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
          height: 100,
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
                  height: 100,
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
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_rounded,
                          ),
                          Flexible(
                            child: Text(
                              "${restaurant.address} ${restaurant.city}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        Flexible(
                            child: Text(
                          "${restaurant.starCount} (${restaurant.ratingCount})",
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
