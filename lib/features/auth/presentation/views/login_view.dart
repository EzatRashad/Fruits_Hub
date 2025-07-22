import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/get_it_service/get_it_service.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

import '../../domain/repos/auth_repo.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => LoginCubit(getIt<AuthRepo>()),
        child: LoginViewBodyBlocConsumer());
  }
}