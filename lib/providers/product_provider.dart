import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  String _productId = "";

  String get productId => _productId;

  void addProductId(id) {
    _productId = id;
    notifyListeners();
  }
}
