import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';

abstract class ProductsCubitState {}
class ProductsInitialState extends ProductsCubitState {}

class ProductsLoadingState extends ProductsCubitState {}

class ProductsSuccessState extends ProductsCubitState {
  List<ProductEntity> products;
  ProductsSuccessState(this.products);
}

class ProductsFailureState extends ProductsCubitState {
  final String errorMessage;
  ProductsFailureState(this.errorMessage);
}
