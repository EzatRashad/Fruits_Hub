import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/core/utils/validation.dart';
import 'package:fruit_hub/core/widgets/custom_buttons.dart';
import 'package:fruit_hub/core/widgets/custom_text_filed.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/terms_and_conditions.dart';
import '../../view_model/signup_cubit/signup_cubit.dart';
import 'have_account.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  bool _isTermsAccepted = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('حساب جديد'),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        padding: EdgeInsets.symmetric(horizontal: 17.w),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFormFiled(
                controller: _nameController,
                hintText: "الاسم كامل",
                validator: (val) => Validation.validateName(val!),
              ),
              13.ph,
              CustomTextFormFiled(
                controller: _emailController,
                hintText: "البريد الإلكتروني",
                validator: (val) => Validation.validateEmail(val!),
              ),
              13.ph,
              CustomTextFormFiled(
                controller: _passwordController,
                hintText: "كلمة المرور",
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.gray150,
                    size: 24.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
                validator: (val) => Validation.validatePassword(val!),
              ),
              16.ph,
              TermsAndConditionsWidget(
                onChanged: (value) {
                  setState(() {
                    _isTermsAccepted = value;
                  });
                },
              ),
              20.ph,
              CustomButtons(
                onPressed: _onSignupPressed,
                text: "إنشاء حساب جديد",
              ),
              20.ph,
              const HaveAccount(),
            ],
          ),
        ),
      ),
    );
  }

  void _onSignupPressed() {
    if (_formKey.currentState!.validate() && _isTermsAccepted) {
      context.read<SignupCubit>().signup(
            email: _emailController.text.trim(),
            password: _passwordController.text,
            name: _nameController.text.trim(),
          );
    } else if (!_isTermsAccepted) {
      "يرجى قبول الشروط والأحكام".showSnackbar(context: context, isSuccess: false);
    } else {
      "يرجى ملء جميع الحقول بشكل صحيح".showSnackbar(context: context, isSuccess: false);
    }
  }
}
