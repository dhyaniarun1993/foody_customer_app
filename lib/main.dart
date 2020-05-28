import 'package:flutter/material.dart';
import 'package:foody_customer_app/views/home/home.dart';
import 'package:foody_customer_app/views/login/send_otp.dart';
import 'package:foody_customer_app/views/login/verify_otp.dart';
import 'package:foody_customer_app/views/signup/signup.dart';
import 'package:foody_customer_app/views/splash/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder> {
      'SPLASH_SCREEN': (BuildContext context) => new SplashScreen(),
      'HOME_SCREEN': (BuildContext context) => new Home(),
      'LOGIN_SEND_OTP_SCREEN': (BuildContext context) => new SendOtp(),
      'LOGIN_VERIFY_OTP_SCREEN': (BuildContext context) => new VerifyOtp(),
      'SIGNUP_SCREEN': (BuildContext context) => new Signup(),
    },
    initialRoute: 'SPLASH_SCREEN',
  ));
}