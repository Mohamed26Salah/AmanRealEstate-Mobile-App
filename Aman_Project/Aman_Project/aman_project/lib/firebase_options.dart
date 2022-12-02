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
    apiKey: 'AIzaSyDfinM2pj07MvLyvagY0biD3erfnXyMeVw',
    appId: '1:487416111209:web:876e9a981d1a845525c2f8',
    messagingSenderId: '487416111209',
    projectId: 'aman-real-estate',
    authDomain: 'aman-real-estate.firebaseapp.com',
    storageBucket: 'aman-real-estate.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB17fZVgpVuyNgdNqRu303NM2aSKc3dIis',
    appId: '1:487416111209:android:ea52d5298f98334225c2f8',
    messagingSenderId: '487416111209',
    projectId: 'aman-real-estate',
    storageBucket: 'aman-real-estate.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDc0y8_K7jalpNgcamvdYnK0XUi7Exc4D0',
    appId: '1:487416111209:ios:485cb5cffaaff65f25c2f8',
    messagingSenderId: '487416111209',
    projectId: 'aman-real-estate',
    storageBucket: 'aman-real-estate.appspot.com',
    iosClientId:
        '487416111209-5e51gh1q1noggtksss2dskod76u2h5cv.apps.googleusercontent.com',
    iosBundleId: 'com.example.amanProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDc0y8_K7jalpNgcamvdYnK0XUi7Exc4D0',
    appId: '1:487416111209:ios:485cb5cffaaff65f25c2f8',
    messagingSenderId: '487416111209',
    projectId: 'aman-real-estate',
    storageBucket: 'aman-real-estate.appspot.com',
    iosClientId:
        '487416111209-5e51gh1q1noggtksss2dskod76u2h5cv.apps.googleusercontent.com',
    iosBundleId: 'com.example.amanProject',
  );
}
