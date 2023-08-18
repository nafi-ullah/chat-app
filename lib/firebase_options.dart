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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA-OhBjG6kzW2Vz0Tbg_tTaduPlCwvGHgE',
    appId: '1:225715573362:web:5da15b7907a2a7c5b268eb',
    messagingSenderId: '225715573362',
    projectId: 'chat-app-9d454',
    authDomain: 'chat-app-9d454.firebaseapp.com',
    storageBucket: 'chat-app-9d454.appspot.com',
    measurementId: 'G-7MRZY9T5JC',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeLLtXYDGnLpnXWMNpwIjy3xtUXvX0bXg',
    appId: '1:225715573362:android:5abd436b340014b7b268eb',
    messagingSenderId: '225715573362',
    projectId: 'chat-app-9d454',
    storageBucket: 'chat-app-9d454.appspot.com',
  );
}