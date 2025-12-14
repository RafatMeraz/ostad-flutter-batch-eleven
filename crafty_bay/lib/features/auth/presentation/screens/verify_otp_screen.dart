import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatefulWidget {
  const VerifyOtpScreen({super.key});

  static const String name = '/verify-otp';

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = TextTheme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              spacing: 8,
              children: [
                AppLogo(width: 90),
                const SizedBox(height: 8),
                Text(
                  'Verify OTP',
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text(
                  'A 4 digits OTP has been sent to your email address',
                  textAlign: .center,
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                PinCodeTextField(
                  length: 4,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    fieldWidth: 50,
                    fieldHeight: 50,
                  ),
                  appContext: context,
                ),
                FilledButton(
                  onPressed: _onTapVerifyButton,
                  child: Text('Verify OTP'),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium,
                    text: 'Already have an account? ',
                    children: [
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.themeColor,
                          fontWeight: .bold,
                        ),
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = _onTapSignInButton,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignInButton() {
    Navigator.pushReplacementNamed(context, SignInScreen.name);
  }

  void _onTapVerifyButton() {}
}
