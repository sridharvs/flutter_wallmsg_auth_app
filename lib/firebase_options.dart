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
        return macos;
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
    apiKey: 'AIzaSyArF3NFx-G6HKqCwfMtsPGwIvWb6QK2gM4',
    appId: '1:848967249496:web:02dd093f916deecb0fa42d',
    messagingSenderId: '848967249496',
    projectId: 'wall-message-app',
    authDomain: 'wall-message-app.firebaseapp.com',
    storageBucket: 'wall-message-app.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9m3JZe4w3GSKMYG6rP8-N68e0GXk1j1w',
    appId: '1:848967249496:android:940272f1a0f6ebc00fa42d',
    messagingSenderId: '848967249496',
    projectId: 'wall-message-app',
    storageBucket: 'wall-message-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBUXK3wOs9mPP2ocv5gH8xBO6Gzu374eFo',
    appId: '1:848967249496:ios:b33a9dd578b65fe30fa42d',
    messagingSenderId: '848967249496',
    projectId: 'wall-message-app',
    storageBucket: 'wall-message-app.appspot.com',
    iosBundleId: 'com.example.flutterWallmsgAuthApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBUXK3wOs9mPP2ocv5gH8xBO6Gzu374eFo',
    appId: '1:848967249496:ios:d5edbf79909804a60fa42d',
    messagingSenderId: '848967249496',
    projectId: 'wall-message-app',
    storageBucket: 'wall-message-app.appspot.com',
    iosBundleId: 'com.example.flutterWallmsgAuthApp.RunnerTests',
  );
}
