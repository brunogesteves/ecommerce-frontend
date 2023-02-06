import 'package:flutter/material.dart';

class ShoppingCart extends ChangeNotifier {
  List<String> _shoppingCart = ['30', '36'];

  int get shoppingCartQty => _shoppingCart.length;
  List<String> get shoppingCart => _shoppingCart;

  void addItem(id) {
    _shoppingCart.add(id);
    notifyListeners();
  }
}
