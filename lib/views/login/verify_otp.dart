import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foody_customer_app/business_logic/view_models/login/verify_otp_viewmodel.dart';

class VerifyOtp extends StatefulWidget {

  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  
  String _phoneNumber;
  String _otp;
  double _height;
  double _width;

  final VerifyOtpViewModel viewModel = VerifyOtpViewModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String validateOTP(String value) {
    if(value.isEmpty){
      return 'OTP is required';
    } 
    Pattern pattern = r'(^[0-9]{6}$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter 6 digit OTP';
    }
    return null;
  }

  validateAndVerifyOtp() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    bool success = await viewModel.verifyOtp(_phoneNumber, _otp);
    if (success) {
      Navigator.of(context).pushNamedAndRemoveUntil('HOME_SCREEN', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    _phoneNumber = args["phone_number"];
    
    return Scaffold(
      body: SafeArea(
        child: ChangeNotifierProvider<VerifyOtpViewModel>(
          create: (context) => viewModel,
          child: Container(
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/login_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _otpTitleRow(),
                    _otpTextRow(),
                    _otpTextFormFieldRow(),
                    _errorRow(),
                    _verifyOtpButtonRow(),
                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );
  }

  Widget _otpTitleRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 5),
      alignment: Alignment.center,
      child: Text(
        "OTP Verification",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50,
        ),
      ),
    );
  }

  Widget _otpTextRow() {
    return Container(
      alignment: Alignment.center,
      child: Text(
        "Enter the code sent to +919971220151",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _otpTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 25,  right: _width / 25, top: _height / 20),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: "OTP",
          labelStyle: TextStyle(color: Colors.black),
          counterText: '',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800]),
          ),
        ),
        maxLength: 6,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
        validator: validateOTP,
        onSaved: (String value) {
          _otp = value;
        },
      ),
    );
  }

  Widget _errorRow() {
    return Consumer<VerifyOtpViewModel>(
      builder: (context, model, child) {
        if (model.hasError) {
          return Container(
            margin: EdgeInsets.only(left: _width / 25, top: _height / 90),
            alignment: Alignment.centerLeft,
            child: Text(
              model.errorMessage,
              style: TextStyle(
                color: Colors.red[800],
                fontWeight: FontWeight.w600,
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

  Widget _verifyOtpButtonRow()  {
    return Container(
      margin: EdgeInsets.only(left: _width  / 25, right: _width  / 25, top: _height / 30 ),
      alignment: Alignment.center,
      child: MaterialButton(
        color: Colors.orange[800],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: validateAndVerifyOtp,
        child: Text("LOGIN",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          )
        ),
      ),
    );
  }
}