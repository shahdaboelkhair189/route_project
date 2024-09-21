import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_project/home/login_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash screen ';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
    });
    return Scaffold(
        body: Image.asset(
      'assets/images/Splash.png',
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
    ));
  }
}
