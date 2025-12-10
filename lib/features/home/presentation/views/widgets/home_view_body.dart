import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service/get_it_service.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_products_grid_view_bloc_builder.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

import 'featured_list.dart';
class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {

    super.initState();
  }
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

