import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class SignupState {}

class SignupInitial extends SignupState {}
class SignupLoading extends SignupState {}
class SignupSuccess extends SignupState {   
  final UserEntity userEntity;

  SignupSuccess(this.userEntity);
}
class SignupFailure extends SignupState {
  final String errorMessage;

  SignupFailure(this.errorMessage);
}