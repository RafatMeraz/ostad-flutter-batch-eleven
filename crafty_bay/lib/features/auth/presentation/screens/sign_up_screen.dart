import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/auth/presentation/widgets/app_logo.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const String name = '/sign-up';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                  'Sign Up',
                  style: textTheme.headlineMedium?.copyWith(fontWeight: .bold),
                ),
                Text(
                  'Get started with your details',
                  style: textTheme.bodyLarge,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: 'First name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: 'Last name'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  decoration: InputDecoration(hintText: 'Password'),
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your password';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  textInputAction: .next,
                  keyboardType: .phone,
                  decoration: InputDecoration(hintText: 'Phone'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your valid phone';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'City'),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return 'Enter your city';
                    }
                    return null;
                  },
                ),
                FilledButton(
                  onPressed: _onTapSignUpButton,
                  child: Text('Sign Up'),
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

  void _onTapSignUpButton() {
    Navigator.pushNamed(context, VerifyOtpScreen.name);
  }

  void _onTapSignInButton() {
    Navigator.pushNamed(context, SignInScreen.name);
  }
}
