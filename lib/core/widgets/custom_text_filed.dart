import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/utils/app_colors.dart';
import 'package:fruit_hub/core/utils/utils.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {super.key,
      required this.title,
      required this.controller,
      this.obscureText = false,
      required this.hintText,
      this.suffixIcon,
      this.validator});
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        8.ph,
        TextFormField(
          validator: validator,
          cursorColor: AppColors.primaryColor,
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.titleSmall,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.gray100,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: 1,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(
                width: .5,
              ),
            ),
            errorMaxLines: 3,
            errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
                width: .5,
              ),
            ),
          ),
        )
      ],
    );
  }
}
