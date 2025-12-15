import 'package:equatable/equatable.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  int quanitty;

  CartItemEntity({required this.productEntity, this.quanitty = 0});

  num calculateTotalPrice() {
    return productEntity.price * quanitty;
  }

  num calculateTotalWeight() {
    return 1 * quanitty;
  }

  increasQuantity() {
    quanitty++;
  }

  decreasQuantity() {
    if (quanitty > 0) {
      quanitty--;
    }
   
  }

  @override
  List<Object?> get props => [productEntity];
}
