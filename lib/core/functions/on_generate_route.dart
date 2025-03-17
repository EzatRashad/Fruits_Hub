import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // navigate to home page
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    // navigate to login page
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    // navigate to Signup page
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    default:
      // navigate to empty scaffold
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
