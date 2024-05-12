import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mobile_assignment_1/core/models/products_model/products_model.dart';
import 'package:mobile_assignment_1/features/resturant/repo/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  ProductsReo productsReo = ProductsReo();
  Future<void> getProducts({required String name}) async {
    emit(ProductsLoading());
    try {
      var products = await productsReo.getProducts(name: name);
      emit(ProductsSuccess(products));
    } catch (e) {
      emit(ProductsFailure());
    }
  }
}
