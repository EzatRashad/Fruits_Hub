
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/get_dummy_product.dart' show getDummyProducts;
import 'package:fruit_hub/core/widgets/product_grid.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit_stste.dart';
import 'package:fruit_hub/features/products/presentation/cubit/products_cubit.dart';
import 'package:fruit_hub/features/products/presentation/cubit/products_cubit_state.dart';
import 'package:skeletonizer/skeletonizer.dart';


 
class ProductsGridViewBlocBuilder extends StatelessWidget {
  const ProductsGridViewBlocBuilder({super.key});

  @override
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsCubitState>(
      builder: (context, state) {
        if (state is ProductsSuccessState) {
          return ProductsGrid(products: state.products);
        } else if (state is ProductsFailureState) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text('Failed to load products'),
            ),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductsGrid(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
