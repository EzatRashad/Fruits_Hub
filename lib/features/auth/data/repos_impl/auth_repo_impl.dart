import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/services/firebase_services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_services/firebase_auth_services.dart';
import 'package:fruit_hub/core/utils/custom_exeptions.dart';
import 'package:fruit_hub/core/utils/failure.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/utils/constants.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices _firebaseAuthServices;
  final DatabaseService _databaseService;
  AuthRepoImpl(this._firebaseAuthServices, this._databaseService);
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
       user = await _firebaseAuthServices.createUserWithEmailAndPassword(
          email, password);
      var userEntity = UserEntity(uId: user.uid, name: name, email: email);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if(user != null){
        await _firebaseAuthServices.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if(user != null){
        await _firebaseAuthServices.deleteUser();
      }
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
      String email, String password) async {
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
    User? user;
    try {
      user = await _firebaseAuthServices.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      if(user != null){
        await _firebaseAuthServices.deleteUser();
      }
      return Left(ServerFailure(e.message));
    } catch (e) {
      if(user != null){
        await _firebaseAuthServices.deleteUser();
      }
      log('Error in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ أثناء تسجيل الدخول'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await _firebaseAuthServices.signInWithFacebook();
      return Right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      log('Error in AuthRepoImpl.signInWithFacebook: ${e.toString()}');
      return Left(ServerFailure('حدث خطأ أثناء تسجيل الدخول'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  @override
  Future addUserData({required UserEntity user}) async {
    try {
      await _databaseService.addUserData(addUserDataEndpoint, user.toMap());
    } catch (e) {
      log('Error in AuthRepoImpl.addUserData: ${e.toString()}');
    }
  }
}
