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
    apiKey: 'AIzaSyAl2b3B15v4N-Fb01Doi4oKbiku1mjKkzk',
    appId: '1:1094340249290:web:d95401cee34da8cabad633',
    messagingSenderId: '1094340249290',
    projectId: 'nomad-twitter-study-challenge',
    authDomain: 'nomad-twitter-study-challenge.firebaseapp.com',
    storageBucket: 'nomad-twitter-study-challenge.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCaeFDcBR9jkdN5KqEw7QfDIDii-7DZZds',
    appId: '1:1094340249290:android:2d60c52669ffff6bbad633',
    messagingSenderId: '1094340249290',
    projectId: 'nomad-twitter-study-challenge',
    storageBucket: 'nomad-twitter-study-challenge.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBw1SkKiBzxkR4DjM6S_5UX2nm-Epr_WQA',
    appId: '1:1094340249290:ios:0daf13279a8c8eb7bad633',
    messagingSenderId: '1094340249290',
    projectId: 'nomad-twitter-study-challenge',
    storageBucket: 'nomad-twitter-study-challenge.appspot.com',
    iosBundleId: 'com.example.challengeDay16',
  );
}
