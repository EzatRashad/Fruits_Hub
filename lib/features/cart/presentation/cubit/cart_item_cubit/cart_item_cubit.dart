import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/cart/domain/entity/car_item_entity.dart' show CartItemEntity;
import 'package:fruit_hub/features/cart/presentation/cubit/cart_item_cubit/cart_item_state.dart';


class CartItemCubit extends Cubit<CartItemState> {
  CartItemCubit() : super(CartItemInitial());

  void updateCartItem(CartItemEntity carItem) {
    emit(CartItemUpdated(carItem));
  }
}
