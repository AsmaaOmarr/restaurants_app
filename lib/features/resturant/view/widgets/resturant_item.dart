import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/core/models/products_model/products_model.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({super.key, required this.product});
  final ProductsModel product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          //color: Constant.main,
          color: Colors.yellow.shade200,
        ),
        child: Center(
            child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "${product.imageUrl}",
                height: 120,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              '${product.productName} ',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                //color: Colors.white,
              ),
            ),
            Text(
              '${product.price} EGP',
              style: const TextStyle(
                fontSize: 18,
                //color: Colors.white,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
