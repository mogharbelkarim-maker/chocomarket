import 'package:flutter/material.dart';

enum AppLanguage { en, ar }

class LanguageProvider with ChangeNotifier {
  AppLanguage _lang = AppLanguage.en;
  AppLanguage get lang => _lang;

  void toggle() {
    _lang = _lang == AppLanguage.en ? AppLanguage.ar : AppLanguage.en;
    notifyListeners();
  }
}
