import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';
import 'package:fruit_hub/features/products/presentation/cubit/products_cubit_state.dart';

 
class ProductsCubit extends Cubit<ProductsCubitState> {
  final GetProductsRepo productsRepo;
  ProductsCubit({required this.productsRepo}) : super(ProductsInitialState());
  int get productsLength {
    if (state is ProductsSuccessState) {
      return (state as ProductsSuccessState).products.length;
    }
    return 0;
  }

  void getProducts() async {
    log('getBestSelling called');
    emit(ProductsLoadingState());
    final results = await productsRepo.getProducts();
    results.fold((failure) {
      emit(ProductsFailureState(failure.message));
      log('ProductsFailureState: ${failure.message}');
    }, (products) {
      log("ProductsSuccessState emitted");
      log('ProductsSuccessState: ${products.length} products fetched');
      log('Products: ${products.map((e) => e.name).toList()}');
      emit(ProductsSuccessState(products));
    });
  }
}
