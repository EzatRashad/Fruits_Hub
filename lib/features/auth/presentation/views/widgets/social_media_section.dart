import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_widget.dart';

import '../../../../../core/utils/app_images.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialWidget(text: "تسجيل بواسطة جوجل", image: Assets.assetsImagesGoogle),
        13.ph,
        SocialWidget(text: "تسجيل بواسطة أبل", image: Assets.assetsImagesApple),
        13.ph,
        SocialWidget(text: "تسجيل بواسطة فيسبوك", image: Assets.assetsImagesFace),
      ],
    );
  }
}