import 'package:flutter/material.dart';

class UserProfile extends ChangeNotifier {
  int _userId = 1;

  int get userId => _userId;
  // List<String> get shoppingCart => _shoppingCart;

  // void addItem(id) {
  //   _shoppingCart.add(id);
  //   notifyListeners();
  // }
}
