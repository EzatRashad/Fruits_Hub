import 'package:flutter/material.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return SignupViewBody();
  }
}