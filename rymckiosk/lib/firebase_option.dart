
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: "AIzaSyBk-W6XnQ6vNifI_Dbi_bBOuoIVKOm4sj4",
    appId: "1:336713801714:web:b6d371bbc7bb55d445d56b",
    messagingSenderId: "336713801714",
    authDomain: "rymc-2728c.firebaseapp.com",
    projectId: "rymc-2728c",
    storageBucket: "rymc-2728c.appspot.com",
    measurementId: "G-MPS9TXJW2E",
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAKQX8szuAjIAmKl7zE_HonVbw6m7ARTRk',
    appId: '1:336713801714:android:024c2943278f295145d56b',
    messagingSenderId: '336713801714',
    projectId: 'rymc-2728c',
    storageBucket: 'rymc-2728c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '336713801714',
    projectId: 'rymc-2728c',
    storageBucket: 'rymc-2728c.appspot.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: '',
    appId: '',
    messagingSenderId: '336713801714',
    projectId: 'otlob-gas',
    storageBucket: 'rymc-2728c.appspot.com',
  );
}
