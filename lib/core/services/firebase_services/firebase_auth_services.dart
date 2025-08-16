import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/utils/custom_exeptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Error in FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()} , Error code: ${e.code} ');

      switch (e.code) {
        case 'invalid-email':
          throw CustomException('البريد الإلكتروني غير صالح.');
        case 'email-already-in-use':
          throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
        case 'operation-not-allowed':
          throw CustomException(
              'تسجيل الدخول باستخدام البريد الإلكتروني غير مفعل.');
        case 'weak-password':
          throw CustomException('كلمة المرور ضعيفة جدًا.');
        case 'network-request-failed':
          throw CustomException(
              'فشل الاتصال بالشبكة. تحقق من اتصال الإنترنت الخاص بك.');
        case 'too-many-requests':
          throw CustomException(
              'تم تجاوز الحد الأقصى للمحاولات. حاول مرة أخرى لاحقًا.');
        case 'invalid-credential':
          throw CustomException('بيانات الاعتماد المقدمة غير صالحة.');
        default:
          throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Error in FirebaseAuthServices.createUserWithEmailAndPassword: ${e.toString()}');
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }

  Future<User> loginWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('Error in FirebaseAuthServices.signIn: ${e.toString()} , Error code: ${e.code} ');

      switch (e.code) {
        case 'invalid-email':
          throw CustomException('البريد الإلكتروني غير صالح.');
        case 'user-disabled':
          throw CustomException('تم تعطيل حساب هذا المستخدم.');
        case 'user-not-found':
         case 'wrong-password':
         case 'invalid-credential':
          throw CustomException('البريد الإلكتروني أو كلمة المرور غير صحيحة.');
        case 'network-request-failed':
          throw CustomException(
              'فشل الاتصال بالشبكة. تحقق من اتصال الإنترنت الخاص بك.');
        case 'too-many-requests':
          throw CustomException(
              'تم تجاوز الحد الأقصى للمحاولات. حاول مرة أخرى لاحقًا.');
        default:
          throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Error in FirebaseAuthServices.signIn: ${e.toString()}');
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }


  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log('Error in FirebaseAuthServices.signOut: ${e.toString()}');
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      log('Error in FirebaseAuthServices.resetPassword: ${e.toString()} , Error code: ${e.code} ');

      switch (e.code) {
        case 'invalid-email':
          throw CustomException('البريد الإلكتروني غير صالح.');
        case 'user-not-found':
          throw CustomException('لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.');
        case 'network-request-failed':
          throw CustomException(
              'فشل الاتصال بالشبكة. تحقق من اتصال الإنترنت الخاص بك.');
        case 'too-many-requests':
          throw CustomException(
              'تم تجاوز الحد الأقصى للمحاولات. حاول مرة أخرى لاحقًا.');
        default:
          throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
      }
    } catch (e) {
      log('Error in FirebaseAuthServices.resetPassword: ${e.toString()}');
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }
}
