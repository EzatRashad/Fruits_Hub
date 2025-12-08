import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';

import 'home_cubit_stste.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  final GetProductsRepo productsRepo;
  HomeCubit({required this.productsRepo}) : super(HomeInitialState());
  void getBestSelling() async {
    log('getBestSelling called');
    emit(GetBestSellingLoadingState());
    final results = await productsRepo.getBestSelling();
    results.fold((failure) {
      emit(GetBestSellingFailureState(failure.message));
      log('GetBestSellingFailureState: ${failure.message}');
    }, (products) {
      log("GetBestSellingSuccessState emitted");
      log('GetBestSellingSuccessState: ${products.length} products fetched');
      log('Products: ${products.map((e) => e.name).toList()}');
      emit(GetBestSellingSuccessState(products));
      
    });
  }
}
