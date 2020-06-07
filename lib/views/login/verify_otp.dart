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

  final VerifyOtpViewModel _viewModel = VerifyOtpViewModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  String _validateOTP(String value) {
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

  _validateAndVerifyOtp() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    bool success = await _viewModel.verifyOtp(phoneNumber: _phoneNumber, otp: _otp);
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
      body: SingleChildScrollView(
        child: ChangeNotifierProvider<VerifyOtpViewModel>(
          create: (context) => _viewModel,
          child: Column(
            children: <Widget>[
              _titleBar(),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: _height/ 12),
                    _otpTextFormFieldRow(),
                    SizedBox(height: _height / 35),
                    _errorRow(),
                    SizedBox(height: _height / 50),
                    _verifyOtpButtonRow(),
                  ],
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

  Widget _titleBar() {
    return Container(
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
      child: Stack(
        children: <Widget>[
          SafeArea(
            child: Container(
              padding: EdgeInsets.only(left: _width/40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white, 
                    onPressed:() => Navigator.pop(context, false),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: _width/20, bottom: _height/35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _otpTitleRow(),
                _otpTextRow(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpTitleRow() {
    return Container(
      child: Text(
        "VERIFY DETAILS",
        style: TextStyle(
          color:  Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _otpTextRow() {
    return Container(
      child: Text(
        "OTP sent to +91" + _phoneNumber,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }

  Widget _otpTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15,  right: _width / 15),
      alignment: Alignment.center,
      child: TextFormField(
        autofocus: true,
        obscureText: false,
        decoration: InputDecoration(
          labelText: "OTP",
          labelStyle: TextStyle(color: Colors.grey[500]),
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
        maxLength: 6,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
        validator: _validateOTP,
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
            margin: EdgeInsets.only(left: _width / 12),
            alignment: Alignment.centerLeft,
            child: Text(
              model.errorMessage,
              style: TextStyle(
                color: Colors.red[500],
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
      margin: EdgeInsets.only(left: _width  / 15, right: _width  / 15 ),
      alignment: Alignment.center,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.orange[500],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: _validateAndVerifyOtp,
        child: Text("VERIFY OTP",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          )
        ),
      ),
    );
  }
}