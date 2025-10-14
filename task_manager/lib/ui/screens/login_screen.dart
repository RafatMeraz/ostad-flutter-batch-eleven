import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/ui/controllers/login_provider.dart';
import 'package:task_manager/ui/screens/forgot_password_verify_email_screen.dart';
import 'package:task_manager/ui/screens/main_nav_bar_holder_screen.dart';
import 'package:task_manager/ui/screens/sign_up_screen.dart';
import 'package:task_manager/ui/widgets/centered_progress_indicator.dart';
import 'package:task_manager/ui/widgets/screen_background.dart';
import 'package:task_manager/ui/widgets/snack_bar_message.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String name = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LoginProvider _loginProvider = LoginProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _loginProvider,
      child: Scaffold(
        body: ScreenBackground(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 82),
                    Text(
                      'Get Started With',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _emailTEController,
                      decoration: InputDecoration(hintText: 'Email'),
                      validator: (String? value) {
                        String inputText = value ?? '';
                        if (EmailValidator.validate(inputText) == false) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _passwordTEController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                      validator: (String? value) {
                        if ((value?.length ?? 0) <= 6) {
                          return 'Password should more than 6 letters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Consumer<LoginProvider>(
                      builder: (context, loginProvider, _) {
                        return Visibility(
                          visible: loginProvider.loginInProgress == false,
                          replacement: CenteredProgressIndicator(),
                          child: FilledButton(
                            onPressed: _onTapLoginButton,
                            child: Icon(Icons.arrow_circle_right_outlined),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 36),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: _onTapForgotPasswordButton,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                              text: "Don't have an account? ",
                              children: [
                                TextSpan(
                                  text: 'Sign up',
                                  style: TextStyle(color: Colors.green),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = _onTapSignUpButton,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapSignUpButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ForgotPasswordVerifyEmailScreen(),
      ),
    );
  }

  void _onTapLoginButton() {
    if (_formKey.currentState!.validate()) {
      _login();
    }
  }

  Future<void> _login() async {
    final bool isSuccess = await _loginProvider.login(
      _emailTEController.text.trim(),
      _passwordTEController.text,
    );
    if (isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        MainNavBarHolderScreen.name,
        (predicate) => false,
      );
    } else {
      showSnackBarMessage(context, _loginProvider.errorMessage!);
    }
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
