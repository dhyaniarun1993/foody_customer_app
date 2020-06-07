import 'package:flutter/material.dart';
import 'package:foody_customer_app/locator.dart';
import 'package:foody_customer_app/providers/authentication_provider.dart';
import 'package:foody_customer_app/data/local_key_value_persistence.dart';

class AuthenticationRepository {
  final _authenticationProvider = AuthenticationProvider();
  final _localStore = locator<LocalKeyValuePersistence>();

  Future<void> sendOtp(String phoneNumber) async {
    await _authenticationProvider.sendOtp(phoneNumber);
    return;
  }

  Future<void> getTokenByOtp({ String phoneNumber, String otp }) async {
    final tokenResponse = await _authenticationProvider.getTokenByOtp(phoneNumber, otp);
    await _localStore.saveToken(tokenResponse);
    return;
  }

  Future<void> signUp({
    @required String phoneNumber,
    @required String email,
    @required String firstName,
    String lastName}) async {
    await _authenticationProvider.signUp(phoneNumber:phoneNumber, email: email, firstName: firstName,
      lastName: lastName);
  }
}