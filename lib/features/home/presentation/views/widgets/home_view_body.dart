import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/search_txt_filed.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_app_bar.dart';

import 'featured_list.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:   Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  HomeAppBar(),
                  16.ph,
                  SearchTextField(),
                  12.ph,
                  FeaturedList(),
                  12.ph,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}