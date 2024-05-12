import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_assignment_1/core/models/search_model/search_model.dart';
import 'package:mobile_assignment_1/features/search/repo/search_repo.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  SearchRepo searchRepo = SearchRepo();

  Future<void> searchByProduct({required String productName}) async {
    emit(SearchLoading());
    try {
      var products = await searchRepo.searchByProduct(productName);
      emit(SearchSuccess(products: products));
    } catch (e) {
      emit(SearchFailure());
    }
  }
}
