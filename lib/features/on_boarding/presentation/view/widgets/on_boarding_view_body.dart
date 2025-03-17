import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/widgets/on_boarding_page_view.dart';

import '../../../../../core/widgets/custom_buttons.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;

  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        currentPage = pageController.page!.round();

        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: OnBoardingPageView(
              pageController: pageController,
            ),
          ),
          DotsIndicator(
            dotsCount: 2,
            //position: currentIndexPage,
            decorator: DotsDecorator(
              color: currentPage == 1
                  ? AppColors.primaryColor
                  // ignore: deprecated_member_use
                  : Colors.green.withOpacity(.5), // Inactive color
              activeColor: AppColors.primaryColor,
            ),
          ),
          const SizedBox(
            height: 29,
          ),
          Visibility(
            visible: currentPage == 1 ? true : false,
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomButtons(onPressed: () {}, text: "ابدأ الان"),
            ),
          ),
          const SizedBox(
            height: 43,
          ),
        ],
      ),
    );
  }
}
