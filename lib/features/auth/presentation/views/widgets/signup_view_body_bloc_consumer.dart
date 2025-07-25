import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/utils/utils.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/signup_cubit/signup_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/view_model/signup_cubit/signup_state.dart';
import 'package:fruit_hub/features/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          "تم إنشاء الحساب بنجاح".showSnackbar(context: context, isSuccess: true);
          Navigator.of(context).pop(); 
        } else if (state is SignupFailure) {
          state.errorMessage.showSnackbar(context: context, isSuccess: false);

        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignupLoading ? true : false,
          
          child: SignupViewBody(),
        );
      },
    );
  }
}
