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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyD2ZngnkIjyy4DrxDsEaeReNrIHScVev3U',
    appId: '1:631260424921:web:c72a495334a0afd683ecc8',
    messagingSenderId: '631260424921',
    projectId: 'reel-6692b',
    authDomain: 'reel-6692b.firebaseapp.com',
    storageBucket: 'reel-6692b.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmR_uSe_tk0YrPGJRQ4eEnketY_wVplhg',
    appId: '1:631260424921:android:afc1d3e770a7eb6a83ecc8',
    messagingSenderId: '631260424921',
    projectId: 'reel-6692b',
    storageBucket: 'reel-6692b.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDACfg0b14MWkFeQqS5UHpQb7Cg1ekSg5k',
    appId: '1:631260424921:ios:73c70401821203f883ecc8',
    messagingSenderId: '631260424921',
    projectId: 'reel-6692b',
    storageBucket: 'reel-6692b.appspot.com',
    iosClientId: '631260424921-e45hdvuh2m027ve5qgtln1k82ctu9b2i.apps.googleusercontent.com',
    iosBundleId: 'com.example.reelRo',
  );
}
