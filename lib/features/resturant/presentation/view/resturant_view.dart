import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/resturant/cubit/products_cubit.dart';
import 'package:mobile_assignment_1/features/resturant/presentation/view/widgets/resturant_view_body.dart';

class ResturantView extends StatelessWidget {
  ResturantView({super.key, required this.resutrantName});
  String? resutrantName;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit()..getProducts(name: resutrantName!),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Resturant name'),
          centerTitle: true,
          elevation: 0,
        ),
        body: ResturantViewBody(),
      ),
    );
  }
}
