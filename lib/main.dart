import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/functions/on_generate_route.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruit_hub/features/splash_screen/presentation/splash_screen_view/splash_screen_view.dart';
import 'core/services/get_it_service/get_it_service.dart';
import 'core/utils/bloc_observar.dart';
import 'firebase_options.dart';
import 'core/services/shared_pref_service/shared_preferences_service.dart';
import 'core/utils/app_theme.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  setup();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPreferencesService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
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
          initialRoute: SplashScreenView.routeName,
        );
      },
    );
  }
}
