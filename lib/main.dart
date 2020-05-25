import 'package:flutter/material.dart';
import 'package:foody_customer_app/views/home/home.dart';
import 'package:foody_customer_app/views/splash/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder> {
      'SPLASH_SCREEN': (BuildContext context) => new SplashScreen(),
      'HOME_SCREEN': (BuildContext context) => new Home(),
    },
    initialRoute: 'SPLASH_SCREEN',
  ));
}