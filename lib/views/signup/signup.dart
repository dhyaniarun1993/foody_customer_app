import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:foody_customer_app/business_logic/view_models/signup/signup_viewmodel.dart';

class Signup extends StatefulWidget {
  
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  String _phoneNumber;
  String _email;
  String _firstName;
  String _lastName;

  double _height;
  double _width;

  final SignupViewModel _viewModel = SignupViewModel();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

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

  String _validateEmail(String value) {
    if(value.isEmpty){
      return 'Email is required';
    } 
    Pattern pattern = r'(^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$)';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
    return null;
  }

  String _validateFirstName(String value) {
    if(value.isEmpty){
      return 'First Name is required';
    } 
    return null;
  }

  _validateAndSignUp() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();
    bool success = await _viewModel.signUp(phoneNumber: _phoneNumber,
      email: _email, firstName: _firstName, lastName: _lastName);
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
        child: ChangeNotifierProvider<SignupViewModel>(
          create: (context) => _viewModel,
          child: Column(
            children: <Widget>[
              _titleBar(),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: _height/12),
                    _phoneNumberTextFormFieldRow(),
                    SizedBox(height: _height/40),
                    _emailTextFormFieldRow(),
                    SizedBox(height: _height/40),
                    _firstNameTextFormFieldRow(),
                    SizedBox(height: _height/40),
                    _lastNameTextFormFieldRow(),
                    SizedBox(height: _height / 35),
                    _errorRow(),
                    SizedBox(height: _height / 50),
                    _signUpButtonRow(),
                    SizedBox(height: _height / 80),
                    _loginTextRow(),
                    SizedBox(height: _height/12),
                  ],
                ),
              )
            ],
          ),
        )
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
          _signUpTitleRow(),
          _signUpTextRow(),
        ],
      ),
    );
  }

  Widget _signUpTitleRow() {
    return Container(
      child: Text(
        "SIGNUP",
        style: TextStyle(
          color:  Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }

  Widget _signUpTextRow() {
    return Container(
      child: Text(
        "Create an account with a new phone number",
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

  Widget _emailTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15, right: _width / 15),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: "Email",
          labelStyle: TextStyle(color: Colors.grey[500]),
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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.text,
        validator: _validateEmail,
        onSaved: (String value) {
          _email = value;
        },
      ),
    );
  }

  Widget _firstNameTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15, right: _width / 15),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: "First Name",
          labelStyle: TextStyle(color: Colors.grey[500]),
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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.text,
        validator: _validateFirstName,
        onSaved: (String value) {
          _firstName = value;
        },
      ),
    );
  }

  Widget _lastNameTextFormFieldRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15, right: _width / 15),
      alignment: Alignment.center,
      child: TextFormField(
        obscureText: false,
        decoration: InputDecoration(
          labelText: "Last Name",
          labelStyle: TextStyle(color: Colors.grey[500]),
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
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        keyboardType: TextInputType.text,
        onSaved: (String value) {
          _lastName = value;
        },
      ),
    );
  }

  Widget _errorRow() {
    return Consumer<SignupViewModel>(
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

  Widget _signUpButtonRow() {
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
        onPressed: _validateAndSignUp,
        child: Text("SIGNUP",
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

  Widget _loginTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
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
              Navigator.of(context).pushReplacementNamed('LOGIN_SEND_OTP_SCREEN');
            },
            child: Text(
              "Login",
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