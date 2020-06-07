import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:foody_customer_app/business_logic/view_models/login/send_otp_viewmodel.dart';

class SendOtp extends StatefulWidget {

  _SendOtpState createState() => _SendOtpState();
}

class _SendOtpState extends State<SendOtp> {
  
  String _phoneNumber;
  SendOtpViewModel viewModel = SendOtpViewModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  double _height;
  double _width;
  
  @override
  void initState() {
    super.initState();
  }

  String _validatePhoneNumber(String value) {
    if(value.isEmpty){
      return 'Phone Number is required';
    } 
    Pattern pattern = r'(^[0-9]{10}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Phone Number';
    }
    return null;
  }

  _validateAndSendOtp() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    bool success = await viewModel.sendOtp(_phoneNumber);
    if (success) {
      Navigator.of(context).pushNamed('LOGIN_VERIFY_OTP_SCREEN', arguments: {"phone_number": _phoneNumber});
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<SendOtpViewModel>(
          create: (context) => viewModel,
          child: Column(
            children: <Widget>[
              _titleBar(),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: _height/ 12),
                    _phoneNumberTextFormFieldRow(),
                    SizedBox(height: _height / 35),
                    _errorRow(),
                    SizedBox(height: _height / 50),
                    _loginButtonRow(),
                    SizedBox(height: _height / 80),
                    _signUpTextRow(),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }

  Widget _titleBar() {
    return Container(
      padding: EdgeInsets.only(left: _width/20, bottom: _height/35),
      height: _height / 3,
      width: _width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Colors.orange[400],
            Colors.orange[200],
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _loginTitleRow(),
          _loginTextRow(),
        ],
      ),
    );
  }

  Widget _loginTitleRow() {
    return Container(
      child: Text(
        "LOGIN",
        style: TextStyle(
          color:  Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _loginTextRow() {
    return Container(
      child: Text(
        "Enter your phone number to proceed",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _phoneNumberTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15, right: _width / 15),
      alignment: Alignment.center,
      child: TextFormField(
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(color: Colors.grey[500]),
          prefixText: "+91",
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
        maxLength: 10,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
        validator: _validatePhoneNumber,
        onSaved: (String value) {
          _phoneNumber = value;
        },
      ),
    );
  }

  Widget _errorRow() {
    return Consumer<SendOtpViewModel>(
      builder: (context, model, child) {
        if (model.hasError) {
          return Container(
            margin: EdgeInsets.only(left: _width / 12),
            alignment: Alignment.centerLeft,
            child: Text(
              model.errorMessage,
              style: TextStyle(
                color: Colors.red[500],
                fontSize: 12
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _loginButtonRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15, right: _width / 15),
      alignment: Alignment.center,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.orange[500],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _validateAndSendOtp,
        child: Text("LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
      )
    );
  }

  Widget _signUpTextRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
            ),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('SIGNUP_SCREEN');
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.orange[600],
                fontSize: 17
              ),
            ),
          )
        ],
      ),
    );
  }
}