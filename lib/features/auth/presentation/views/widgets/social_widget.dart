import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_colors.dart';

class SocialWidget extends StatelessWidget {
  const SocialWidget(
      {super.key, required this.text, required this.image, this.onTap});
  final String text;
  final String image;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 46.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.gray100, width: .5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              image,
              width: 24.w,
              height: 24.h,
            ),
            Text(text,
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 16.sp,
                    )),
            Text(""),
          ],
        ),
      ),
    );
  }
}
