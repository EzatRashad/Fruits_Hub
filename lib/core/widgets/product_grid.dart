import 'package:flutter/material.dart';
import 'package:fruit_hub/core/get_products_repo/domain/entity/product_entity.dart'
    show ProductEntity;
import 'package:fruit_hub/core/widgets/fruit_item.dart';
class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => FruitItem(product: products[index]),
        childCount: products.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
    );
  }
}

