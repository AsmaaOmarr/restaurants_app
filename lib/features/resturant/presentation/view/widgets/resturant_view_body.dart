import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/core/models/products_model/products_model.dart';
import 'package:mobile_assignment_1/features/resturant/cubit/products_cubit.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/widgets/resturant_item.dart';

class ResturantViewBody extends StatelessWidget {
  ResturantViewBody({super.key});
  List<ProductsModel> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          products = state.products;
        }
        return Column(children: [
          Expanded(
              child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return ResturantItem(
                      product: products[index],
                    );
                  }))
        ]);
      },
    );
  }
}
