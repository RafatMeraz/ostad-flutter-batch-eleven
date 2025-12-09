import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations {
    return AppLocalizations.of(this)!;
  }
}
