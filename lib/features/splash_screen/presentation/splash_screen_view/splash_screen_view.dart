import 'package:flutter/material.dart';
import 'package:fruit_hub/features/splash_screen/presentation/splash_screen_view/widgets/splash_screen_view_body.dart';
 
class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});
  static const String routeName = "splashScreen";


  @override
  Widget build(BuildContext context) {
    return const SplashScreenViewBody();
  }
}