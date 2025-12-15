
import 'package:fruit_hub/features/cart/domain/entity/car_item_entity.dart';

abstract class CartItemState {
  const CartItemState();
}

final class CartItemInitial extends CartItemState {}

final class CartItemUpdated extends CartItemState {
  final CartItemEntity cartItemEntity;

  const CartItemUpdated(this.cartItemEntity);
}