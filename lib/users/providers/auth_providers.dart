import 'package:flutter/material.dart';

class AuthProviders extends ChangeNotifier {

  bool _isLogedIn = false;
  String _username = '';

  bool get isLogedIn => _isLogedIn;
  String get username => _username;

  void loggin(String name) {
    _username = name;
    _isLogedIn = true;
    notifyListeners();
  }

  void logOut() {
    _isLogedIn = false;
    _username = '';
    notifyListeners(); 
  }
}
