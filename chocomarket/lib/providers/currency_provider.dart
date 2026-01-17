import 'package:flutter/material.dart';

enum Currency { lbp, usd }

class CurrencyProvider with ChangeNotifier {
  Currency _currency = Currency.lbp;
  Currency get currency => _currency;

  void toggle() {
    _currency = _currency == Currency.lbp ? Currency.usd : Currency.lbp;
    notifyListeners();
  }
}
