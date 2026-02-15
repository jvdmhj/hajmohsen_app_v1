import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hajmohsen/models/cart_items.dart';
import 'package:hajmohsen/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  final List<CartItem> _items=[];

  int get totalPrice {
    int total=0;
    for(var item in items){
      total+=item.product.price * item.quantity;
    }
    return total;
  }
    CartProvider() {
      loadCart();
    }

  List<CartItem> get items => _items;

    void clearAll() {
      _items.clear();
      saveCart();
      notifyListeners();
  }

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
    saveCart();
    notifyListeners();
  }

  bool isInCart(Product product) {
    return _items.any((item)=>item.product==product);
  }
  void removeItems(int index) {
    _items.removeAt(index);
      saveCart();
    notifyListeners();
  }
  Future<void> saveCart() async{
   final prefs=await SharedPreferences.getInstance();

   final cartJson=items.map((item)=>item.toJson()).toList();

   prefs.setString('cart_items',jsonEncode(cartJson));
  }
  Future<void> loadCart() async{
      final prefs=await SharedPreferences.getInstance();

      final cartString=prefs.getString('cart_items');

      if(cartString != null){
        final List decoded=jsonDecode(cartString);

        _items.clear();

        _items.addAll(
          decoded.map((item)=>CartItem.fromJson(item)).toList()
          );

        notifyListeners();
      }
  }
}