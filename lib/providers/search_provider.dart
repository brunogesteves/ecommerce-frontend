import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _searchTerm = "";
  int _searchtime = 1;

  String get searchTerm => _searchTerm;
  int get searchtime => _searchtime;

  void searchFor(term) {
    _searchTerm = term;
    notifyListeners();
  }

  void resetSearch(timer) {
    _searchtime = timer;
    notifyListeners();
  }
}
