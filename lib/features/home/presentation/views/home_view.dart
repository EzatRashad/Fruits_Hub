import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service/get_it_service.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit_stste.dart';
import 'package:fruit_hub/features/home/presentation/views/widgets/home_view_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}
