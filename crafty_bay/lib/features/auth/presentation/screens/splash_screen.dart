import 'package:crafty_bay/features/auth/presentation/providers/auth_controller.dart';
import 'package:crafty_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 2));
    await AuthController.getUserData();
    Navigator.pushNamedAndRemoveUntil(
      context,
      MainNavHolderScreen.name,
      (predicate) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
