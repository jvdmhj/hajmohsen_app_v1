import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hajmohsen/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProviders with ChangeNotifier{
  final List<Product> _favorite = [];

  List<Product> get favorite => _favorite;

 bool isFavorite(Product product) {
  return _favorite.any((p) => p.name == product.name);
}

void toggleFavorite(Product product) {
  if (isFavorite(product)) {
    _favorite.removeWhere((p) => p.name == product.name);
  } else {
    _favorite.add(product);
  }
  saveFavorite();
  notifyListeners();
}

    FavoriteProviders() {
      loadFavorites();
    }
    void removeFavoritesItems(int index) {
    _favorite.removeAt(index);
    notifyListeners();
  }
  void clearAll() {
    _favorite.clear();
    saveFavorite();
    notifyListeners();
  }

  Future<void> saveFavorite() async{
    final prefs=await SharedPreferences.getInstance();
    final jsonList=_favorite.map((fave)=>fave.toJson()).toList();
    await prefs.setString('favorite_items',jsonEncode(jsonList));
  }

  Future<void> loadFavorites() async{
    final prefs=await SharedPreferences.getInstance();
      final jsonString=prefs.getString('favorite_items');
      if(jsonString != null) {
        final List decoded=jsonDecode(jsonString);
        _favorite.clear();
        _favorite.addAll(decoded.map((item) => Product.fromJson(item)).toList());
          notifyListeners();
      }
  }

}