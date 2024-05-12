import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/models/search_model/product.dart';
import 'package:mobile_assignment_1/features/search/view/widgets/restaurnat_card.dart';

class PlacesOfProductViewBody extends StatelessWidget {
  const PlacesOfProductViewBody({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () {},
              child: const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "See on Map 🗺️    ",
                  style: TextStyle(
                    color: Constant.kMainColor,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: product.restaurants?.length ?? 0,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                    restaurant: product.restaurants![index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
