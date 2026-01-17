import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _items = {};
  Map<String, Product> get items => _items;

  void add(Product product) {
    _items[product.id] = product;
    notifyListeners();
  }

  void remove(String id) {
    _items.remove(id);
    notifyListeners();
  }

  double totalPrice(bool usd) {
    return _items.values.fold(0, (sum, p) => sum + (usd ? p.priceUSD : p.priceLBP));
  }
}
