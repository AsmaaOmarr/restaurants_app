import 'package:flutter/material.dart';
import 'package:mobile_assignment_1/features/search/presentation/view/widgets/search_bar.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(children: [
          SizedBox(height: 20),
          CustomSearchBar(),
          Center(child: Text('Search View Body')),
        ]),
      ),
    );
  }
}
