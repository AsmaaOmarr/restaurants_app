import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/all_resutrant_model.dart';
import 'package:mobile_assignment_1/features/home/cubit/cubit/home_cubit.dart';

import 'package:mobile_assignment_1/features/home/view/widgets/home_item.dart';

// class HomeViewBody extends StatelessWidget {
//   HomeViewBody({super.key});
//   AllResutrantModel? allResturants;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<HomeCubit, HomeState>(
//       builder: (context, state) {
//         if (state is HomeSuccess) {
//           allResturants = state.resturantModel;
//         }
//         return Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                       itemCount: allResturants?.restaurants?.length,
//                       itemBuilder: (context, index) {
//                         return HomeItem(
//                           resturant: allResturants?.restaurants?[index] ??
//                               ResturantModel(),
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
class HomeViewBody extends StatelessWidget {
  HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        AllResutrantModel? allResturants;
        if (state is HomeSuccess) {
          allResturants = state.resturantModel;
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: allResturants?.restaurants?.length ?? 0,
                    itemBuilder: (context, index) {
                      final restaurant = allResturants?.restaurants?[index];
                      if (restaurant != null) {
                        return HomeItem(resturant: restaurant);
                      } else {
                        // Handle the case where restaurant is null
                        return SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
