import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/core/models/search_model/product.dart';
import 'package:mobile_assignment_1/features/search/view/widgets/places_of_product_view_body.dart';

class PlacesOfProductView extends StatelessWidget {
  const PlacesOfProductView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Resturants & Cafes"),
      ),
      body: PlacesOfProductViewBody(product: product),
    );
  }
}
