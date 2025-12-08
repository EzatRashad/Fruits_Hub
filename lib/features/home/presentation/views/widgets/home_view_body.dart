import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

import 'featured_list.dart';
class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const HomeAppBar(),

            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    16.ph,
                    const SearchTextField(),
                    12.ph,
                    const FeaturedList(),
                    12.ph,
                    const BestSellingHeader(),
                    12.ph,
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

