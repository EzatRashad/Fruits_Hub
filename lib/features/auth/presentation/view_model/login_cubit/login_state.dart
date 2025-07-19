import '../../../domain/entities/user_entity.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoading extends LoginState {}
class LoginSuccess extends LoginState {
  final UserEntity userEntity;

  LoginSuccess(this.userEntity);
}
class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}