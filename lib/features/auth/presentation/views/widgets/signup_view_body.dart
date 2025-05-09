import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/core/widgets/custom_text_filed.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'have_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  late bool isTermsAccepted = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('حساب جديد'),
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
                CustomTextFormFiled(controller: name, hintText: "الاسم كامل"),
                13.ph,
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
                16.ph,
                TermsAndConditionsWidget(
                  onChanged: (value) {
                    isTermsAccepted = value;
                  },
                ),
                20.ph,
                CustomButtons(onPressed: () {}, text: "إنشاء حساب جديد"),
                20.ph,
                HaveAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
