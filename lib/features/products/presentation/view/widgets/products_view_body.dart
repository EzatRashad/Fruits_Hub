import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/products/presentation/cubit/products_cubit.dart';
import 'package:fruit_hub/features/products/presentation/view/widgets/products_app_bar.dart';
import 'package:fruit_hub/features/products/presentation/view/widgets/products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/features/products/presentation/view/widgets/products_view_header.dart';

class ProductsViewBody extends StatelessWidget {
  const ProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const ProductsAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.ph,
                    const SearchTextField(),
                   
                    12.ph,
                      ProductsViewHeader(
                        productsLength:
                           context.read<ProductsCubit>().productsLength 
                    ),
                    12.ph,
                  ],
                ),
              ),
            ),
            const ProductsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}