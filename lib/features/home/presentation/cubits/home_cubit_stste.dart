import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';

abstract class HomeCubitState {}

class HomeInitialState extends HomeCubitState {}

class GetBestSellingLoadingState extends HomeCubitState {}

class GetBestSellingSuccessState extends HomeCubitState {
  List<ProductEntity> products;
  GetBestSellingSuccessState(this.products);
}

class GetBestSellingFailureState extends HomeCubitState {
  final String errorMessage;
  GetBestSellingFailureState(this.errorMessage);
}
