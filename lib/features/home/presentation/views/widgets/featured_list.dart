import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/featured_item.dart';

class FeaturedList extends StatefulWidget {
  const FeaturedList({super.key});

  @override
  State<FeaturedList> createState() => _FeaturedListState();
}

class _FeaturedListState extends State<FeaturedList> {
  final PageController _pageController = PageController();
  final int itemCount = 4;
  Timer? _timer;
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        double? currentPage = _pageController.page;
        int nextPage = (currentPage ?? 0).toInt() + 1;

        if (nextPage >= itemCount) {
          nextPage = 0;
        }

        _pageController.animateToPage(
          nextPage,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }


  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

    @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 158.h,
          child: PageView.builder(
            controller: _pageController,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.r),
                child: FeaturedItem(),
              );
            },
          ),
          
        ),
        8.ph,
        SmoothPageIndicator(
          controller: _pageController,
          count: itemCount,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            dotColor: AppColors.gray150,
            activeDotColor: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
