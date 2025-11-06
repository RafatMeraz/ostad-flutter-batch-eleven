import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_live_score_app/app.dart';
import 'package:firebase_live_score_app/fcm_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FCMService.initialize();
  print(await FCMService.getToken());

  // Flutter Error
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  FirebaseAnalytics.instance.setUserId(id: '2134');

  FirebaseCrashlytics.instance.setCustomKey('user-id', '12323');
  FirebaseCrashlytics.instance.setCustomKey('user-role', 'admin');

  runApp(const FootballLiveScoreApp());
}