import 'package:crafty_bay/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/auth/presentation/screens/verify_otp_screen.dart';
import 'package:crafty_bay/features/common/presentation/screens/main_nav_holder_screen.dart';
import 'package:crafty_bay/features/product/presentation/screens/product_details_screen.dart';
import 'package:crafty_bay/features/product/presentation/screens/product_list_by_category_screen.dart';
import 'package:flutter/material.dart';

import '../features/category/data/models/category_model.dart';

class AppRoutes {
  static Route<dynamic> routes(RouteSettings settings) {
    Widget widget = SizedBox();

    if (settings.name == SplashScreen.name) {
      widget = SplashScreen();
    } else if (settings.name == SignUpScreen.name) {
      widget = SignUpScreen();
    } else if (settings.name == SignInScreen.name) {
      widget = SignInScreen();
    } else if (settings.name == VerifyOtpScreen.name) {
      final email = settings.arguments as String;
      widget = VerifyOtpScreen(email: email);
    } else if (settings.name == MainNavHolderScreen.name) {
      widget = MainNavHolderScreen();
    } else if (settings.name == ProductListByCategoryScreen.name) {
      final categoryModel = settings.arguments as CategoryModel;
      widget = ProductListByCategoryScreen(categoryModel: categoryModel);
    } else if (settings.name == ProductDetailsScreen.name) {
      final productId = settings.arguments as String;
      widget = ProductDetailsScreen(productId: productId);
    }

    return MaterialPageRoute(builder: (ctx) => widget);
  }
}
