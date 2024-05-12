import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/features/search/cubit/search_cubit.dart';
import 'package:mobile_assignment_1/features/search/data/models/search_model/product.dart';
import 'package:mobile_assignment_1/features/search/presentation/view/widgets/search_bar.dart';
import 'package:mobile_assignment_1/features/search/presentation/view/widgets/search_item.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          const SizedBox(height: 20),
          CustomSearchBar(
            labelText: 'Search products',
            icon: const Icon(CupertinoIcons.search),
            onChange: (String value) {
              BlocProvider.of<SearchCubit>(context)
                  .searchByProduct(productName: value);
            },
          ),
          const SizedBox(height: 10),
          BlocBuilder<SearchCubit, SearchState>(
            builder: (context, state) {
              if (state is SearchLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is SearchSuccess) {
                List<Product>? productsList = state.products.products;
                if (productsList == null || productsList.isEmpty) {
                  return const Expanded(
                    child: Center(
                      child: Text("No Products Found"),
                    ),
                  );
                } else {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: productsList.length,
                      itemBuilder: (context, index) {
                        return CustomSearchItem(product: productsList[index]);
                      },
                    ),
                  );
                }
              }
              return const Expanded(
                  child: Center(child: Text("search by product")));
            },
          ),
        ]),
      ),
    );
  }
}
