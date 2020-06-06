import 'dart:convert';
import 'package:foody_customer_app/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foody_customer_app/business_logic/models/remote/authentication/token_response.dart';

class LocalKeyValuePersistence {

  static LocalKeyValuePersistence _instance;

  static LocalKeyValuePersistence getInstance() {
    if (_instance == null) {
      _instance = LocalKeyValuePersistence();
    }
    return _instance;
  }

  saveToken(TokenResponse tokenDetails) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(foodyAuthTokenKey, json.encode(tokenDetails));
  }

  Future<TokenResponse> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonTokenDetails = json.decode(preferences.getString(foodyAuthTokenKey));
    return TokenResponse.fromJson(jsonTokenDetails);
  }
}