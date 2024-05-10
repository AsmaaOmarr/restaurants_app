import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/widgets/resturant_item.dart';

class ResturantViewBody extends StatelessWidget {
  const ResturantViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const ResturantItem();
              }))
    ]);
  }
}
