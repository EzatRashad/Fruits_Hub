import 'package:flutter/material.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart'
    show ProductEntity;
import 'package:fruit_hub/core/widgets/fruit_item.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: products.length ,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 163 / 214,
        mainAxisSpacing: 8,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) => FruitItem(product: products[index]),
    );
  }
}
