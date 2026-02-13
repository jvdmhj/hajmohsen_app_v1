import 'package:flutter/material.dart';
import 'package:hajmohsen/auth/login_page.dart';
import 'package:hajmohsen/users/pages/main_page.dart';
import 'package:hajmohsen/users/providers/auth_providers.dart';
import 'package:provider/provider.dart';

class EntryPage extends StatelessWidget {
  const EntryPage({super.key});

  @override
  Widget build(BuildContext context) {
      final auth=context.watch<AuthProviders>();
      if(auth.isLogedIn){
        return MainPage();
      }else{
          return LoginPage();
      }
  }
}