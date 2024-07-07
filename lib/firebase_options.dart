// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyAtuXgEhICe5wGFVEdtSLP6KZuY7Y6nu8U',
    appId: '1:189109064550:web:116bb48e25e7332b38aea7',
    messagingSenderId: '189109064550',
    projectId: 'wynk-clone-9c148',
    authDomain: 'wynk-clone-9c148.firebaseapp.com',
    storageBucket: 'wynk-clone-9c148.appspot.com',
    measurementId: 'G-RR1PWQ67HN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBcabcOvJxyXuV4aP6iGO41VZaOR7-F2k',
    appId: '1:189109064550:android:40ab3ca31e866e2938aea7',
    messagingSenderId: '189109064550',
    projectId: 'wynk-clone-9c148',
    storageBucket: 'wynk-clone-9c148.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCh5VY5QiIOtKyAvo948YRwQmGpWQWAiYQ',
    appId: '1:189109064550:ios:a2cf31d7de839e0938aea7',
    messagingSenderId: '189109064550',
    projectId: 'wynk-clone-9c148',
    storageBucket: 'wynk-clone-9c148.appspot.com',
    androidClientId: '189109064550-1btk8gr88b4bln9m7grd80s7u9tqebl4.apps.googleusercontent.com',
    iosClientId: '189109064550-vounak2c1p5m5u487v6uo0itcrvgog7j.apps.googleusercontent.com',
    iosBundleId: 'com.example.wynkClone',
  );
}