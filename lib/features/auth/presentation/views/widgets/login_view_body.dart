import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/core/widgets/custom_text_filed.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/custom_divider.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/forget_password.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/social_media_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

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
                    controller: email, hintText: "البريد الإلكتروني"),
                13.ph,
                CustomTextFormFiled(
                  controller: password,
                  hintText: "كلمة المرور",
                  obscureText: true,
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: AppColors.gray150,
                    size: 24.sp,
                  ),
                ),
                13.ph,
                ForgetPassword(),
                20.ph,
                CustomButtons(onPressed: () {
                  if (_formKey.currentState!.validate()  ) {
                        context.read<LoginCubit>().login(
                              email: email.text.trim(),
                              password: password.text,
                            );
                      } else {
                        "يرجى ملء جميع الحقول بشكل صحيح"
                            .showSnackbar(context: context, isSuccess: false);
                      }
                }, text: "تسجيل دخول"),
                20.ph,
                DoNotHaveAccount(),
                16.ph,
                CustomDivider(),
                16.ph,
                SocialMediaSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
