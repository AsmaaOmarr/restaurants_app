import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/home/cubit/cubit/home_cubit.dart';
import 'package:mobile_assignment_1/features/home/view/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getResturantList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Restaurants'),
          centerTitle: true,
        ),
        body: HomeViewBody(),
      ),
    );
  }
}
