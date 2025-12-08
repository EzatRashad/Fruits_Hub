import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/get_dummy_product.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/best_selling/presentation/view/widgets/best_selling_app_bar.dart';
import 'package:fruit_hub/core/widgets/product_grid.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: CustomScrollView(
            slivers: [
              const BestSellingAppBar(),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    12.ph,
                    ProductsGrid(products: getDummyProducts()),
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
