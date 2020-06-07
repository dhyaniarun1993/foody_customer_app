import 'package:flutter/material.dart';
import 'package:foody_customer_app/business_logic/view_models/baseModel.dart';
import 'package:foody_customer_app/constants/viewstate.dart';
import 'package:foody_customer_app/repositories/authentication_repository.dart';

class  SignupViewModel extends BaseModel {
  final _authenticationRepository = AuthenticationRepository();
  bool hasError;
  String errorMessage;

  SignupViewModel() {
    hasError = false;
    errorMessage = "";
  }

  Future<bool> signUp({
    @required String phoneNumber, 
    @required String email, 
    @required String firstName, 
    @required String lastName
  }) async {
    setState(ViewState.Busy);
    try {
      await _authenticationRepository.signUp(phoneNumber: phoneNumber, email: email,
      firstName: firstName, lastName: lastName);
      hasError = false;
      setState(ViewState.Idle);
      return true;
    } catch(e) {
      errorMessage = e.toString();
      hasError = true;
      setState(ViewState.Idle);
      return false;
    }
  }
}