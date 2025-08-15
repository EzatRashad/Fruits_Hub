import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:fruit_hub/features/splash_screen/presentation/splash_screen_view/splash_screen_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/signup_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (_) => const LoginView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (_) => const SignupView());
    case SplashScreenView.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreenView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
//    Navigator.pushReplacementNamed(context, LoginView.routeName);
//Navigator.pushNamed(context, SignupView.routeName);
