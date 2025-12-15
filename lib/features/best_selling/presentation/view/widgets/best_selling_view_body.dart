import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/best_selling/presentation/view/widgets/best_selling_view_header.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_products_grid_view_bloc_builder.dart';

import 'best_selling_app_bar.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            BestSellingAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.ph,
                    const SearchTextField(),
                    12.ph,
                    BestSellingViewHeader(
                        productsLength:
                            context.read<HomeCubit>().productsLength),
                  ],
                ),
              ),
            ),
            const BestProductsGridViewBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
