import 'package:flutter/material.dart';

class LoginPageBackground extends StatelessWidget {
  final Widget child;
  const LoginPageBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFFE0),
        image: DecorationImage(
          image: AssetImage('assets/images/loginbackground.jpg'),
          fit: BoxFit.fill,
          opacity: 0.7,
        ),
      ),

      child: child,
    );
  }
}
