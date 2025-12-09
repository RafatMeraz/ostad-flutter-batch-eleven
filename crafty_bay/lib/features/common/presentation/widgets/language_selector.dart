import 'package:crafty_bay/app/providers/language_provider.dart';
import 'package:crafty_bay/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(AppLocalizations.of(context)!.changeLanguage),
        DropdownMenu<String>(
          initialSelection: context
              .read<LanguageProvider>()
              .currentLocale
              .languageCode,
          onSelected: (String? language) {
            context.read<LanguageProvider>().changeLocale(Locale(language!));
          },
          dropdownMenuEntries: [
            DropdownMenuEntry(value: 'en', label: 'English'),
            DropdownMenuEntry(value: 'bn', label: 'বাংলা'),
            DropdownMenuEntry(value: 'de', label: 'Deutsch'),
          ],
        ),
      ],
    );
  }
}
