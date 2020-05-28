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
  TextEditingController phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  String validatePhoneNumber(String value) {
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

  validateAndSaveForm() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    bool success = await viewModel.sendOtp(_phoneNumber);
    if (success) {
      Navigator.of(context).pushNamed('LOGIN_VERIFY_OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
        child: ChangeNotifierProvider<SendOtpViewModel>(
          create: (context) => viewModel,
          child: Container(
            height: _height,
            width: _width,
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    imageRow(),
                    loginTitleRow(),
                    loginTextRow(),
                    phoneNumberTextFormFieldRow(),
                    errorRow(),
                    loginButtonRow(),
                    signUpTextRow(),
                  ],
                ),
              ),
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

  Widget phoneNumberTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, right: _width / 20),
      alignment: Alignment.topLeft,
      child: TextFormField(
        controller: phoneNumberController,
        obscureText: false,
        decoration: InputDecoration(
          labelText: "Phone Number",
          labelStyle: TextStyle(color: Colors.grey),
          prefixText: "+91",
          counterText: '',
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange[800]),
          )
        ),
        maxLength: 10,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
        validator: validatePhoneNumber,
        onSaved: (String value) {
          _phoneNumber = value;
        },
      ),
    );
  }

  Widget errorRow() {
    return Consumer<SendOtpViewModel>(
      builder: (context, model, child) {
        if (model.hasError) {
          return Container(
            margin: EdgeInsets.only(left: _width / 20, right: _width / 20, top: _height / 90),
            alignment: Alignment.centerLeft,
            child: Text(
              model.errorMessage,
              style: TextStyle(
                color: Colors.red[800],
                fontWeight: FontWeight.w400,
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

  Widget loginButtonRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, right: _width / 20,  top: _height / 30),
      alignment: Alignment.topLeft,
      child: MaterialButton(
        color: Colors.orange[800],
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: validateAndSaveForm,
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
              Navigator.of(context).pushNamed('SIGNUP');
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