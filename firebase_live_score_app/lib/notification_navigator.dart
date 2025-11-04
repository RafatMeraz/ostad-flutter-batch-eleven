import 'package:firebase_live_score_app/app.dart';
import 'package:flutter/material.dart';

// Demo navigation handler
class NotificationNavigator {
  static void handleNavigation(String path) {
    if (path == '/home') {
      Navigator.pushNamed(FootballLiveScoreApp.navigator.currentContext!, '/');
    }
  }
}
