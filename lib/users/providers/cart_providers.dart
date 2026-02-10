import 'package:flutter/material.dart';
import 'package:hajmohsen/models/cart_items.dart';
import 'package:hajmohsen/models/product.dart';

class CartProvider with ChangeNotifier{
  final List<CartItem> _items=[];

  List<CartItem> get items => _items;

  void addToCart(Product product,int quantity) {
      final index = _items.indexWhere(
      (item) => item.product == product,
    );
    if(index>=0){
      _items[index].quantity+=quantity;
    }else{
      _items.add(
        CartItem(product: product,quantity: quantity)
      );
    }
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _items.any((item)=>item.product==product);
  }
  void removeItems(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}