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
    apiKey: 'AIzaSyBdoPqQHFFVrt4tKrFPMMwSyjV4yoxRK-8',
    appId: '1:528517558386:web:20eea5449cb40d653212eb',
    messagingSenderId: '528517558386',
    projectId: 'machapstore12',
    authDomain: 'machapstore12.firebaseapp.com',
    storageBucket: 'machapstore12.appspot.com',
    measurementId: 'G-6SJVBNR7DD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBhWwYUPaUZFQFIM4j3Ou_dTlQ5sgYodes',
    appId: '1:528517558386:android:401127a5bac2bbde3212eb',
    messagingSenderId: '528517558386',
    projectId: 'machapstore12',
    storageBucket: 'machapstore12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBa1w8bK4U5dRy2xu72aferv46NVLZV5tA',
    appId: '1:528517558386:ios:1387b77a4acdf1c53212eb',
    messagingSenderId: '528517558386',
    projectId: 'machapstore12',
    storageBucket: 'machapstore12.appspot.com',
    iosBundleId: 'com.example.machapstore1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBa1w8bK4U5dRy2xu72aferv46NVLZV5tA',
    appId: '1:528517558386:ios:6964c6a3b57d3d7c3212eb',
    messagingSenderId: '528517558386',
    projectId: 'machapstore12',
    storageBucket: 'machapstore12.appspot.com',
    iosBundleId: 'com.example.machapstore1.RunnerTests',
  );
}
