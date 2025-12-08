import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';

import 'products_cubit_state.dart';

class ProductsCubit extends Cubit<ProductsCubitState> {
  final GetProductsRepo productsRepo;
  ProductsCubit({required this.productsRepo}) : super(ProductsInitialState());

  void getProducts() async {
    emit(ProductsLoadingState());
    final results = await productsRepo.getProducts();
    results.fold(
      (failure) {
        emit(ProductsFailureState(failure.message));
      },
      (products) {
        emit(ProductsSuccessState(products));
      },
    );
  }
}
