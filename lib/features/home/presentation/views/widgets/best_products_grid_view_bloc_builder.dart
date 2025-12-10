
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/functions/get_dummy_product.dart' show getDummyProducts;
import 'package:fruit_hub/core/widgets/product_grid.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit_stste.dart';
import 'package:skeletonizer/skeletonizer.dart';


import '../../cubits/home_cubit.dart';

class BestProductsGridViewBlocBuilder extends StatefulWidget {
  const BestProductsGridViewBlocBuilder({super.key});

  @override
  State<BestProductsGridViewBlocBuilder> createState() =>
      _BestProductsGridViewBlocBuilderState();
}

class _BestProductsGridViewBlocBuilderState
    extends State<BestProductsGridViewBlocBuilder> {
  @override
  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeCubitState>(
      builder: (context, state) {
        if (state is GetBestSellingSuccessState) {
          return ProductsGrid(products: state.products);
        } else if (state is GetBestSellingFailureState) {
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
