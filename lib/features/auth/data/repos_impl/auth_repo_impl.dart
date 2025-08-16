import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/firebase_services/firebase_auth_services.dart';
import 'package:fruit_hub/core/utils/custom_exeptions.dart';
import 'package:fruit_hub/core/utils/failure.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices _firebaseAuthServices;
  AuthRepoImpl(this._firebaseAuthServices);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await _firebaseAuthServices.createUserWithEmailAndPassword(
          email, password);
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.createUserWithEmailAndPassword: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ أثناء إنشاء الحساب'));
    }
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassword(
      String email, String password)async {
        try {
          var user = await _firebaseAuthServices.loginWithEmailAndPassword(
              email, password);
          return Right(UserModel.fromFirebaseUser(user));
        } on CustomException catch (e) {
          return Left(ServerFailure(e.message));
        } catch (e) {
          log('Error in AuthRepoImpl.loginWithEmailAndPassword: ${e.toString()}');
          return Left(ServerFailure('حدث خطأ أثناء تسجيل الدخول'));
        }
        
      }
      @override
      Future<Either<Failure, UserEntity>> signInWithGoogle() async {
        try {
          var user = await _firebaseAuthServices.signInWithGoogle();
          return Right(UserModel.fromFirebaseUser(user));
        } on CustomException catch (e) {
          return Left(ServerFailure(e.message));
        } catch (e) {
          log('Error in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
          return Left(ServerFailure('حدث خطأ أثناء تسجيل الدخول'));
        }
      }
}
