import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foody_customer_app/business_logic/models/remote/authentication/token_request.dart';
import 'package:foody_customer_app/business_logic/models/remote/authentication/token_response.dart';
import 'package:foody_customer_app/business_logic/models/remote/error/error_response.dart';

class AuthenticationService {
  final Dio _dio = Dio();

  // Todo: move the configuration out and have different config for different env
  final String _clientID = "com.foody.customer.app";
  final String _clientSecret = "zrS7EcNF8kfQyZErrHMnnJUnTGV5E638";

  // Todo: move the configuration out and have different config for different env
  AuthenticationService() {
    _dio.options.baseUrl = "http://10.0.2.2:3000";
    _dio.options.connectTimeout = 1000;
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }

  Future<void> sendOtp(String phoneNumber) async {
    try {
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_clientID:$_clientSecret'));
      await _dio.post('/v1/auth/send-otp',
        options: Options(headers: <String, String>{'authorization': basicAuth}),
        data: { "phone_number": phoneNumber });
      return;
    } on DioError catch(e) {
      if (e.type == DioErrorType.RESPONSE) {
        ErrorResponse error = ErrorResponse.fromJson(e.response.data);
        throw error;
      } else {
        ErrorResponse error = ErrorResponse("Something went wrong");
        throw error;
      }
    }
  }

  Future<TokenResponse> getTokenByOtp(String phoneNumber, String otp) async {
    try {
      String basicAuth  = 'Basic ' + base64Encode(utf8.encode('$_clientID:$_clientSecret'));
      TokenByOtpRequest request = TokenByOtpRequest(phoneNumber: phoneNumber, otp: otp, grantType: 'otp');
      Response response =  await _dio.post('/v1/auth/token',
        options: Options(headers: <String, String>{'authorization':  basicAuth}),
        data: request.toJson());
      TokenResponse tokenResponse = TokenResponse.fromJson(response.data);
      return tokenResponse;
    } on DioError catch(e) {
      if (e.type == DioErrorType.RESPONSE) {
        ErrorResponse error  = ErrorResponse.fromJson(e.response.data);
        throw error;
      } else {
        ErrorResponse error  = ErrorResponse("Something went wrong");
        throw error;
      }
    }
  }
}