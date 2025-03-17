import 'package:flutter/material.dart';
import 'package:fruit_hub/features/on_boarding/presentation/view/on_boarding_view.dart';

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    //
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (_) => const OnBoardingView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
}
