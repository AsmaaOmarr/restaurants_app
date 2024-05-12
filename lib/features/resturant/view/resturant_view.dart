import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/resturant/cubit/products_cubit.dart';
import 'package:mobile_assignment_1/features/resturant/view/widgets/resturant_view_body.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key, required this.restaurantName});
  final String? restaurantName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(name: restaurantName!),
      child: Scaffold(
        appBar: AppBar(
          title: Text(restaurantName!),
          centerTitle: true,
          elevation: 0,
        ),
        body: RestaurantViewBody(),
      ),
    );
  }
}
