import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/widgets/custom_network_image.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
                child: CustomNetworkImage(
                  imageUrl:
                      "https://images.pexels.com/photos/46174/strawberries-berries-fruit-freshness-46174.jpeg",
                ),
              ),
              Positioned(
                top: 2,
                right: 2,
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.3),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              "فراولة",
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '10 جنية ',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.secondryColor,
                          fontSize: 13.sp,
                        ),
                  ),
                  TextSpan(
                    text: '/',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.secondryColor,
                          fontSize: 13.sp,
                        ),
                  ),
                  TextSpan(
                    text: 'كيلو',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.secondryLight,
                          fontSize: 13.sp,
                        ),
                  ),
                ],
              ),
              textAlign: TextAlign.right,
            ),

            /// زر الإضافة
            trailing: GestureDetector(
              onTap: () {},
              child: const CircleAvatar(
                backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
