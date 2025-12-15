 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';
import 'package:fruit_hub/features/cart/domain/entity/car_item_entity.dart' show CartItemEntity;
import 'package:fruit_hub/features/cart/domain/entity/cart_entity.dart';
import 'package:fruit_hub/features/cart/presentation/cubit/cart_cubit/cart_state.dart';
 

 
class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExis(productEntity);
    var carItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      carItem.increasQuantity();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());
  }
}
