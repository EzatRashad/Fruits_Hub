import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "لا تمتلك حساب؟ ",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.gray150, fontSize: 16.sp),
          ),
          TextSpan(
            text: "قم بإنشاء حساب",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primaryColor, fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
