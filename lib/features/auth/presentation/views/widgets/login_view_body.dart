import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/core/widgets/custom_text_filed.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_widget.dart';

import '../../../../../core/utils/app_images.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController controller = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('تسجيل دخول'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextFormFiled(
                    controller: controller, hintText: "البريد الإلكتروني"),
                13.ph,
                CustomTextFormFiled(
                  controller: controller,
                  hintText: "كلمة المرور",
                  obscureText: true,
                  suffixIcon:
                      Icon(Icons.remove_red_eye, color: AppColors.gray150,size: 24.sp,),
                ),
                13.ph,
                ForgetPassword(),
                20.ph,
                CustomButtons(onPressed: () {}, text: "تسجيل دخول"),
                20.ph,
                DoNotHaveAccount(),
                16.ph,
                CustomDivider(),
                16.ph,
                SocialWidget(text: "تسجيل بواسطة جوجل", image: Assets.imagesGoogle),
                13.ph,
                SocialWidget(text: "تسجيل بواسطة أبل", image: Assets.imagesApple),
                13.ph,
                SocialWidget(text: "تسجيل بواسطة فيسبوك", image: Assets.imagesFace),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
