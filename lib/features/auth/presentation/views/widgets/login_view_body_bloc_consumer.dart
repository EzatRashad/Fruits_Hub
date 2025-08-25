import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/services/shared_pref_service/shared_preferences_service.dart';
import 'package:fruit_hub/core/utils/constants.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/login_cubit/login_state.dart';
import 'package:fruit_hub/features/layout/presentation/view/layout_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          "تم تسجيل الدخول بنجاح"
              .showSnackbar(context: context, isSuccess: true);
          Navigator.of(context).pushNamedAndRemoveUntil(
            LayoutView.routeName,
            (Route<dynamic> route) => false,
          );
                              SharedPreferencesService.setBool(logined, true);

        } else if (state is LoginFailure) {
          state.errorMessage.showSnackbar(context: context, isSuccess: false);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading ? true : false,
          child: LoginViewBody(),
        );
      },
    );
  }
}
