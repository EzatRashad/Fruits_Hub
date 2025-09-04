import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_grid.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/best_selling_header.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

import 'featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: CustomScrollView(
            slivers: [
              const HomeAppBar(),
              SliverToBoxAdapter(
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
                    BestSellingGrid(),
                    
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
