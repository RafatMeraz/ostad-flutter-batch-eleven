import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  final String _localeKey = 'locale';

  Locale _currentLocale = Locale('en');

  Locale get currentLocale => _currentLocale;

  Future<void> loadInitialLanguage() async {
    Locale locale = await _getLocale();
    _currentLocale = locale;

    notifyListeners();
  }

  void changeLocale(Locale newLocale) {
    if (_currentLocale == newLocale) return;

    _currentLocale = newLocale;
    _saveLocale(_currentLocale.languageCode);

    notifyListeners();
  }

  Future<void> _saveLocale(String locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_localeKey, locale);
  }

  Future<Locale> _getLocale() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String savedLocale = sharedPreferences.getString(_localeKey) ?? 'en';
    return Locale(savedLocale);
  }
}
