// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDy-GLYGlOzxKJJQx46iM96uoqO3ru87n0',
    appId: '1:477613903102:web:3d95e6a1c34465e3d5a9af',
    messagingSenderId: '477613903102',
    projectId: 'fruit-hub-e5473',
    authDomain: 'fruit-hub-e5473.firebaseapp.com',
    storageBucket: 'fruit-hub-e5473.firebasestorage.app',
    measurementId: 'G-D7TEXXP8S3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiRvVBGf0zpJFNTtF5NLEkGD37pVkuaFU',
    appId: '1:477613903102:android:091b58cbff76f636d5a9af',
    messagingSenderId: '477613903102',
    projectId: 'fruit-hub-e5473',
    storageBucket: 'fruit-hub-e5473.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBT1a2fbL2DO17m6oCWTgfMnHkD8mOuP88',
    appId: '1:477613903102:ios:6af1b4cc8d097c34d5a9af',
    messagingSenderId: '477613903102',
    projectId: 'fruit-hub-e5473',
    storageBucket: 'fruit-hub-e5473.firebasestorage.app',
    iosBundleId: 'com.example.fruitHub',
  );
}
