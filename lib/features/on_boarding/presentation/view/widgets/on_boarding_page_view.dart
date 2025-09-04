import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/widgets/on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        OnBoardingPageViewItem(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'مرحبًا بك في',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                'HUB',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.secondryColor,
                    ),
              ),
              Text(
                'Fruit',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primaryColor,
                    ),
              ),
            ],
          ),
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          image: Assets.assetsImagesPageViewItem1Image,
          backImage: Assets.assetsImagesPageViewItem1Back,
          visible: true,
        ),
        OnBoardingPageViewItem(
          title: Text('ابحث وتسوق'),
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          image: Assets.assetsImagesPageViewItem2Image,
          backImage: Assets.assetsImagesPageViewItem2Back,
          visible: false,
        ),
      ],
    );
  }
}
