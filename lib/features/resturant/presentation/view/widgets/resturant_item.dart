import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobile_assignment_1/constant.dart';
import 'package:mobile_assignment_1/core/models/products_model/products_model.dart';

class ResturantItem extends StatelessWidget {
  ResturantItem({super.key, required this.product});
  ProductsModel product = ProductsModel();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Constant.main,
        ),
        child: Center(
            child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                "${product.imageUrl}",
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            Text('${product.productName}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white)),
            Text('${product.price} \$',
                style: const TextStyle(fontSize: 18, color: Colors.white)),
          ],
        )),
      ),
    );
  }
}
