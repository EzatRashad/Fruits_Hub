import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/utils/custom_exeptions.dart';

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
      if (e.code == 'weak-password') {
        throw CustomException('لكلمة المرور ضعيفة جدًا.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException('هذا البريد الإلكتروني مستخدم بالفعل.');
      } else {
        throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
      }
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException('لا يوجد مستخدم مسجل بهذا البريد الإلكتروني.');
      } else if (e.code == 'wrong-password') {
        throw CustomException('كلمة المرور المدخلة غير صحيحة.');
      } else {
        throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
      }
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      throw CustomException('حدث خطأ غير معروف. حاول مرة أخرى لاحقًا.');
    }
  }
}
