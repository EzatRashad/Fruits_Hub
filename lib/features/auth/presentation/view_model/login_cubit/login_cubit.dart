import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginInitial());
  final AuthRepo authRepo;
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());
    final result = await authRepo.loginWithEmailAndPassword(email, password);
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(LoginLoading());
    final result = await authRepo.signInWithFacebook();
    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (userEntity) => emit(LoginSuccess(userEntity)),
    );
  }

}
