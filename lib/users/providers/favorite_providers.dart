import 'package:flutter/material.dart';
import 'package:hajmohsen/models/product.dart';

class FavoriteProviders with ChangeNotifier{
  final List<Product> _favorite = [];

  List<Product> get favorite => _favorite;

  bool isFavorite(Product product) {
    return _favorite.contains(product);
  }
  void toggleFavorite(Product product){
    if(_favorite.contains(product)){
       _favorite.remove(product);
    }else{
      _favorite.add(product);
    }
    notifyListeners();

  }
    void removeFavoritesItems(int index) {
    _favorite.removeAt(index);
    notifyListeners();
  }
  void clearAll() {
    _favorite.clear();
    notifyListeners();
  }
}