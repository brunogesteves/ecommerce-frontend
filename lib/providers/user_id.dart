import 'package:flutter/material.dart';

class UserProfile extends ChangeNotifier {
  Map<String, dynamic> _userInfo = {};
  bool _isUserConnected = false;
  List<dynamic> _userProducts = [];

  Map<String, dynamic> get userInfo => _userInfo;
  List<dynamic> get userProducts => _userProducts;
  bool get isUserConnected => _isUserConnected;

  void changeUserData(data) {
    _isUserConnected = data["status"];
    _userInfo.addAll(data["content"]);
    notifyListeners();
  }

  void closeSession(status) {
    _isUserConnected = false;
    notifyListeners();
  }
}
