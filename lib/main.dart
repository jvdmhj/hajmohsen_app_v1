import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hajmohsen/auth/login_page.dart';
import 'package:hajmohsen/users/pages/main_page.dart';
import 'package:hajmohsen/users/providers/auth_providers.dart';
import 'package:hajmohsen/users/providers/cart_providers.dart';
import 'package:hajmohsen/users/providers/favorite_providers.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>CartProvider(),),
        ChangeNotifierProvider(create: (_)=>FavoriteProviders(),),
        ChangeNotifierProvider(create: (_)=>AuthProviders(),),
      ],
      child:MyApp() ,
      ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('fa', ''),
      supportedLocales: const [
        Locale('fa', ''),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context,child) {
        return Directionality(textDirection: TextDirection.rtl, child:child!);
      },
      debugShowCheckedModeBanner: false,
      title: 'HAJ MOHSEN',
      home: Consumer<AuthProviders>(
        builder:(context,auth,_) {
          debugPrint('is login:${auth.isLogedIn}');
            if(auth.isLogedIn){
        return MainPage();
      }else{
          return LoginPage();
      }
        } )
    );
  }
}


