import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/restaurant.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/resturant_view.dart';

class HomeItem extends StatelessWidget {
  HomeItem({super.key, required this.resturant});
  Restaurant resturant = Restaurant();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResturantView(
                resutrantName: resturant.name,
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            color: Constant.main,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${resturant.imageUrl}',
                    width: 130,
                    fit: BoxFit.cover,
                  )),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  children: [
                    Flexible(
                      child: Text(
                        '${resturant.name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 18,

                            // fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        Flexible(
                          child: Text(
                            "${resturant.address} ${resturant.city}",
                            style: TextStyle(color: Colors.white),
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
                        "${resturant.starCount} (${resturant.ratingCount})",
                        style: TextStyle(color: Colors.white),
                      ))
                    ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
