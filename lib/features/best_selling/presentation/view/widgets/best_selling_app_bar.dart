import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widgets/back_widget.dart';
import 'package:fruit_hub/core/widgets/default_image_widget.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_images.dart';

class BestSellingAppBar extends StatelessWidget {
  const BestSellingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      
      floating: true,
      snap: true,
       leading: BackWidget(),
      actions: [
        Container(
          padding: EdgeInsets.all(8.r),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: DefaultImageWidget(Assets.assetsImagesNotification),
        ),
      ],
      
    );
  }
}
