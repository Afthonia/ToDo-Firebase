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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6qiM5GG9rm4bgTIVHdM6c1b3mOiVQwso',
    appId: '1:188584422313:android:02e8da566eb9dce24e72b8',
    messagingSenderId: '188584422313',
    projectId: 'todo-db168',
    storageBucket: 'todo-db168.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBrXI10Hz7lDHgJcJmiaVvIYgAWvDuJvsw',
    appId: '1:188584422313:ios:64ae2abcb634b5224e72b8',
    messagingSenderId: '188584422313',
    projectId: 'todo-db168',
    storageBucket: 'todo-db168.appspot.com',
    androidClientId: '188584422313-p6hj7jaut8oce98kcg07dvjlr4t2ssd9.apps.googleusercontent.com',
    iosClientId: '188584422313-nt6cot0cu6ur6spsu63735k84cvkl0r3.apps.googleusercontent.com',
    iosBundleId: 'com.example.todo',
  );
}
