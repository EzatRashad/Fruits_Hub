import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/get_products_repo/domain/repo/get_products_repo.dart';
import 'package:fruit_hub/core/services/get_it_service/get_it_service.dart';
import 'package:fruit_hub/features/layout/presentation/view/widgets/layout_view_body.dart';
import 'package:fruit_hub/features/home/presentation/cubits/home_cubit.dart';

class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  static const String routeName = 'layout';

  @override
  Widget build(BuildContext context) {
    return const LayoutViewBody();
  }
}
