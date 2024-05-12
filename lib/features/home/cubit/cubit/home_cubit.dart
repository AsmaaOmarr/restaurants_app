import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_assignment_1/core/models/all_resutrant_model/all_resutrant_model.dart';
import 'package:mobile_assignment_1/features/home/data/repo/restraunt_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  RepoRestaurant repoRestaurant = RepoRestaurant();

  Future<void> getResturantList() async {
    // print('Fetching restaurant list...');
    emit(HomeLoading());
    try {
      // print('Fetching restaurant list...');
      var resturantModel = await repoRestaurant.getRestaurantList();
      //  print('Fetching restaurant list...');
      emit(HomeSuccess(resturantModel));
    } catch (e) {
      emit(HomeFailure());
    }
  }
}
