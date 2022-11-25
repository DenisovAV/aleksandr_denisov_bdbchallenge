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
    apiKey: 'AIzaSyDKhfAxG4GNTnEXiqzYp6FsIvKkDSBJEUA',
    appId: '1:924253547758:web:c0dd1cf6b0e5ad4df297ff',
    messagingSenderId: '924253547758',
    projectId: 'flutter-test-94ae9',
    authDomain: 'flutter-test-94ae9.firebaseapp.com',
    storageBucket: 'flutter-test-94ae9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAxK6s9uBPNKgzKgoIL6szpUyM-SFzlIgA',
    appId: '1:924253547758:android:157582f48486cee8f297ff',
    messagingSenderId: '924253547758',
    projectId: 'flutter-test-94ae9',
    storageBucket: 'flutter-test-94ae9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCV4qOhwDZjBQ7d_wVglgYoY0mxvAQghiI',
    appId: '1:924253547758:ios:aebee09b337685aaf297ff',
    messagingSenderId: '924253547758',
    projectId: 'flutter-test-94ae9',
    storageBucket: 'flutter-test-94ae9.appspot.com',
    androidClientId: '924253547758-rm8o0j1rta6m05l88rbg1citjn2sa8fe.apps.googleusercontent.com',
    iosClientId: '924253547758-5kbri3imhj4cjn269ovn91vb3uqg4muj.apps.googleusercontent.com',
    iosBundleId: 'com.example.bdbChallenge',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCV4qOhwDZjBQ7d_wVglgYoY0mxvAQghiI',
    appId: '1:924253547758:ios:aebee09b337685aaf297ff',
    messagingSenderId: '924253547758',
    projectId: 'flutter-test-94ae9',
    storageBucket: 'flutter-test-94ae9.appspot.com',
    androidClientId: '924253547758-rm8o0j1rta6m05l88rbg1citjn2sa8fe.apps.googleusercontent.com',
    iosClientId: '924253547758-5kbri3imhj4cjn269ovn91vb3uqg4muj.apps.googleusercontent.com',
    iosBundleId: 'com.example.bdbChallenge',
  );
}
