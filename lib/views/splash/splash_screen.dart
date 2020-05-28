import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('LOGIN_SEND_OTP_SCREEN');
  }

  @override void initState() {
    super.initState();
    startTime();
  }

  @override build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[new Image.asset('assets/logo.png')],
      ),
    );
  }
}