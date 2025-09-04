import 'package:flutter/material.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/widgets/default_image_widget.dart';
import 'package:fruit_hub/core/services/shared_pref_service/shared_preferences_service.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/home/presentation/views/home_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';

class SplashScreenView extends StatelessWidget {
  static const String routeName = '/splash';

  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenViewBody();
  }
}

class SplashScreenViewBody extends StatefulWidget {
  const SplashScreenViewBody({super.key});

  @override
  State<SplashScreenViewBody> createState() => _SplashScreenViewBodyState();
}

class _SplashScreenViewBodyState extends State<SplashScreenViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );

    scaleAnimation = Tween<double>(begin: 0.8, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOutBack),
    );

    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      bool toLogin = SharedPreferencesService.getBool(onBordSkip) ?? false;
      bool toHome = SharedPreferencesService.getBool(logined) ?? false;

      Navigator.of(context).pushNamedAndRemoveUntil(
        toHome
            ? HomeView.routeName
            : (toLogin ? LoginView.routeName : OnBoardingView.routeName),
        (route) => false,
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: FadeTransition(
          opacity: fadeAnimation,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: DefaultImageWidget(Assets.assetsImagesLogo),
          ),
        ),
      ),
    );
  }
}
