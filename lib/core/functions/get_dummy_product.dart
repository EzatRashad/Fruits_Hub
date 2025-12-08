
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: 'Apple',
    code: '123',
    description: 'Fresh apple',
    price: 2.5,
    category: 'Fruits',
    imageUrl: null,
    reviews: [],
    expiryMonths: 6,
    numOfCalories: 100,
    isOrganic: true,
    isFeatured: true,
    stockQuantity: 20,
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
