import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

import '../../../../core/utils/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name);
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password);
  Future<void> signOut();
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  Future<Either<Failure, UserEntity>> signInWithApple();
  Future addUserData({required UserEntity user});
}
