import 'package:flutter/material.dart';

class SendOtp extends StatefulWidget {

  _SendOtpState createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  
  double _height;
  double _width;
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: _height,
            width: _width,
            child: Column(
              children: <Widget>[
                imageRow(),
                loginTitleRow(),
                loginTextRow(),
                phoneNumberTextFieldRow(),
                loginButtonRow(),
                signUpTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageRow() {
    return Container(
      child: Image.asset(
        'assets/food_sketch.jpg',
        fit: BoxFit.fitWidth,
        width: _width,
      ),
      height: _height/2,
    );
  }

  Widget loginTitleRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 30),
      alignment: Alignment.topLeft,
      child: Text(
        "LOGIN",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget loginTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20),
      alignment: Alignment.topLeft,
      child: Text(
        "Enter your phone number",
        style: TextStyle(
          fontWeight: FontWeight.w200,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget phoneNumberTextFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, right: _width / 20),
      alignment: Alignment.topLeft,
      child: TextField(
        controller: phoneNumberController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: "Phone Number",
          prefixText: "+91",
        ),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
      ),
    );
  }

  Widget loginButtonRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, right: _width / 20,  top: _height / 30),
      alignment: Alignment.topLeft,
      child: MaterialButton(
        color: Colors.orange[800],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
      )
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('SIGNUP');
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.orange[200],
                fontSize: 17
              ),
            ),
          )
        ],
      ),
    );
  }
}