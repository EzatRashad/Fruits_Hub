import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: "تمتلك حساب بالفعل؟ ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.gray150, fontSize: 16.sp),
            ),
            TextSpan(
              text: "تسجيل دخول",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
