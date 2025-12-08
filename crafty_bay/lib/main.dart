// Initial Set up
// 1. Folder structure
// 2. Firebase set up
// 3. Firebase crashlytics
// 4. Firebase analytics
// 5. Localization
// 6. Theme
// 7. Routing
// 8. Network Caller

import 'dart:async';
import 'dart:ui';

import 'package:crafty_bay/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(CraftyBayApp());
}
