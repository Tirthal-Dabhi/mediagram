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
    apiKey: 'AIzaSyBVX_rgdpb5LZkEKb5nKxX58r2EKAa5WJU',
    appId: '1:701775829619:web:f21fb79a9005eca7a4e806',
    messagingSenderId: '701775829619',
    projectId: 'mediagram-chatapp',
    authDomain: 'mediagram-chatapp.firebaseapp.com',
    databaseURL: 'https://mediagram-chatapp-default-rtdb.firebaseio.com',
    storageBucket: 'mediagram-chatapp.appspot.com',
    measurementId: 'G-NXN9H5FPYL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB0mkVW-e86xvjzrqrdaXjUW1Fx_6phueA',
    appId: '1:701775829619:android:61d8cdfab7cae8f2a4e806',
    messagingSenderId: '701775829619',
    projectId: 'mediagram-chatapp',
    databaseURL: 'https://mediagram-chatapp-default-rtdb.firebaseio.com',
    storageBucket: 'mediagram-chatapp.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDm4DdJosd0nhXuWF29FOQLh1yEeehR_bg',
    appId: '1:701775829619:ios:e7d088e30fc23578a4e806',
    messagingSenderId: '701775829619',
    projectId: 'mediagram-chatapp',
    databaseURL: 'https://mediagram-chatapp-default-rtdb.firebaseio.com',
    storageBucket: 'mediagram-chatapp.appspot.com',
    androidClientId: '701775829619-cl9l9j6blm3a6ulkn3s6lhh0n8tsl07c.apps.googleusercontent.com',
    iosClientId: '701775829619-st1ai3je1sj86fp2dan7qer2r7etpjdi.apps.googleusercontent.com',
    iosBundleId: 'com.example.mediagram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDm4DdJosd0nhXuWF29FOQLh1yEeehR_bg',
    appId: '1:701775829619:ios:d780301bffeef6c1a4e806',
    messagingSenderId: '701775829619',
    projectId: 'mediagram-chatapp',
    databaseURL: 'https://mediagram-chatapp-default-rtdb.firebaseio.com',
    storageBucket: 'mediagram-chatapp.appspot.com',
    androidClientId: '701775829619-cl9l9j6blm3a6ulkn3s6lhh0n8tsl07c.apps.googleusercontent.com',
    iosClientId: '701775829619-0uhnv0ig10rrttr5e5a7khm8ib13nnon.apps.googleusercontent.com',
    iosBundleId: 'com.example.mediagram.RunnerTests',
  );
}
