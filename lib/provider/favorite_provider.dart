import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _items = [];
  List<String> get items => _items;

  void toggleFavorite(String item) {
    final isExist = _items.contains(item);
    if (isExist) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void clearFavorite() {
    _items = [];
    notifyListeners();
  }
}
