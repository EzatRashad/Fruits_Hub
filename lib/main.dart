import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/on_generate_route.dart';
import 'package:fruit_hub/features/auth/presentation/views/login_view.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';

import 'core/services/shared_preferences_service.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/constants.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  bool toLogin = SharedPreferencesService.getBool(onBordSkip)?? false;
 
  runApp( MyApp(toLogin: toLogin,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.toLogin});
  final bool toLogin;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: const Locale('ar'),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: AppTheme.currentTheme,
          onGenerateRoute: onGenerateRoute,
          initialRoute:toLogin? LoginView.routeName: OnBoardingView.routeName,
        );
      },
    );
  }
}
