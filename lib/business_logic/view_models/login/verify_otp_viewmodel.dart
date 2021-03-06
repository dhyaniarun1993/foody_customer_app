import 'package:flutter/material.dart';
import 'package:foody_customer_app/business_logic/view_models/baseModel.dart';
import 'package:foody_customer_app/constants/viewstate.dart';
import 'package:foody_customer_app/repositories/authentication_repository.dart';

class VerifyOtpViewModel extends BaseModel {

  final _authenticationRepository = AuthenticationRepository();
  bool hasError;
  String errorMessage;

  VerifyOtpViewModel()  {
    hasError = false;
  }

  Future<bool> verifyOtp({
    @required String phoneNumber,
    @required String otp
  }) async {
    setState(ViewState.Busy);
    try {
      await _authenticationRepository.getTokenByOtp(phoneNumber: phoneNumber, otp: otp);
      hasError = false;
      setState(ViewState.Idle);
      return true;
    } catch (e) {
      errorMessage = e.toString();
      hasError = true;
      setState(ViewState.Idle);
      return false;
    }

  }
}