import 'package:firebase_live_score_app/app.dart';
import 'package:firebase_live_score_app/fcm_service.dart';
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
  runApp(const FootballLiveScoreApp());
}