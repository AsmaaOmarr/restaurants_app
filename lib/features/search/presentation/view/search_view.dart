import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/search/cubit/search_cubit.dart';
import 'package:mobile_assignment_1/features/search/presentation/view/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: const Scaffold(
        body: SearchViewBody(),
      ),
    );
  }
}
