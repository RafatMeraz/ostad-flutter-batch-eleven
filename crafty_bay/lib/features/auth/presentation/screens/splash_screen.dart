import 'package:crafty_bay/app/extensions/localization_extension.dart';
import 'package:crafty_bay/features/common/presentation/widgets/language_selector.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String name = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(context.localizations.hello),
            LanguageSelector()
          ],
        ),
      ),
    );
  }
}
