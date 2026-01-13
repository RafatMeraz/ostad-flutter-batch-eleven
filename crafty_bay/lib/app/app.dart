import 'package:crafty_bay/app/app_routes.dart';
import 'package:crafty_bay/app/app_theme.dart';
import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/app/providers/theme_provider.dart';
import 'package:crafty_bay/features/auth/presentation/screens/splash_screen.dart';
import 'package:crafty_bay/features/category/presentation/providers/category_list_provider.dart';
import 'package:crafty_bay/features/common/presentation/providers/main_nav_container_provider.dart';
import 'package:crafty_bay/features/home/presentation/provider/home_slider_provider.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class CraftyBayApp extends StatefulWidget {
  const CraftyBayApp({super.key});

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<CraftyBayApp> createState() => _CraftyBayAppState();
}

class _CraftyBayAppState extends State<CraftyBayApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LanguageProvider()..loadInitialLanguage(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeProvider()..loadInitialThemeMode(),
        ),
        ChangeNotifierProvider(create: (_) => MainNavContainerProvider()),
        ChangeNotifierProvider(create: (_) => CategoryListProvider()),
        ChangeNotifierProvider(create: (_) => HomeSliderProvider())
      ],
      child: Consumer<LanguageProvider>(
        builder: (context, languageProvider, child) {
          return Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return MaterialApp(
                navigatorKey: CraftyBayApp.navigatorKey,
                initialRoute: SplashScreen.name,
                onGenerateRoute: AppRoutes.routes,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeProvider.currentThemeMode,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: [Locale('en'), Locale('bn'), Locale('de')],
                locale: languageProvider.currentLocale,
              );
            }
          );
        },
      ),
    );
  }
}
