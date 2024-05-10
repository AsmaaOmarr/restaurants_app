import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/widgets/resturant_view_body.dart';

class ResturantView extends StatelessWidget {
  const ResturantView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resturant name'),
        centerTitle: true,
        elevation: 0,
      ),
      body: const ResturantViewBody(),
    );
  }
}
