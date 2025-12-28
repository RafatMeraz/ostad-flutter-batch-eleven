import 'dart:convert';

import 'package:crafty_bay/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static const _tokenKey = 'access-token';
  static const _userKey = 'user-data';

  static UserModel? userModel;
  static String? accessToken;

  static Future<void> saveUserData(String token, UserModel model) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString(_tokenKey, token);
    await preferences.setString(_userKey, jsonEncode(model.toJson()));
    accessToken = token;
    userModel = model;
  }

  static Future<void> getUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    accessToken = preferences.getString(_tokenKey);
    if (accessToken != null) {
      final String? userData = preferences.getString(_userKey);
      if (userData != null) {
        userModel = UserModel.fromJson(jsonDecode(userData));
      }
    }
  }

  static Future<bool> isAlreadyLoggedIn() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(_tokenKey) != null;
  }

  static Future<void> clearUserData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }
}
