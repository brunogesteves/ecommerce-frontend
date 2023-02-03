import 'package:flutter/material.dart';

class ShoppingCart extends ChangeNotifier {
  List<String> _shoppingCart = [];
  int _number = 0;
//
  int get number => _number;

  void addItem(id) {
    _shoppingCart.add(id);
    _number = _shoppingCart.length;
    notifyListeners();
  }
}
