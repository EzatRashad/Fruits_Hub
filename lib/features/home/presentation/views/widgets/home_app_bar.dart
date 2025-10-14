import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/get_user_local.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/default_image_widget.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true, 
      snap: true,           
      expandedHeight: 80.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Row(
            children: [
              DefaultImageWidget(Assets.assetsImagesProfile),

              12.horizontalSpace,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "صباح الخير !..",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.gray150, fontSize: 16.sp),
                  ),
                  Text(
                    getUserLocal().name  ,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),

              const Spacer(),

              Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: DefaultImageWidget(Assets.assetsImagesNotification),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
