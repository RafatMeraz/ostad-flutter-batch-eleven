import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';

import 'app.dart';
import 'notification_navigator.dart';

class FCMService {
  static Future<void> initialize() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    // Foreground
    FirebaseMessaging.onMessage.listen(_handleNotification);

    // Background
    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotification);

    // Terminated
    FirebaseMessaging.onBackgroundMessage(_handleTerminatedNotification);
  }

  static void _handleNotification(RemoteMessage message) {
    print(message.data);
    print(message.notification?.title);
    print(message.notification?.body);
    bool shouldNavigate = message.data['should_navigate'] ?? false;
    if (shouldNavigate) {
      NotificationNavigator.handleNavigation(message.data['route_name']);
      // Navigator.pushNamed(FootballLiveScoreApp.navigator.currentContext!, message.data['route_name']);
    }
  }

  static Future<String?> getToken() async {
    return FirebaseMessaging.instance.getToken();
  }

  static void onTokenRefresh() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print(newToken);
      // Call update Token API
    });
  }
}

Future<void> _handleTerminatedNotification(RemoteMessage message) async {}
