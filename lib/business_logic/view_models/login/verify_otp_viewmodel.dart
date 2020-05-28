import 'package:foody_customer_app/business_logic/models/remote/authentication/token_response.dart';
import 'package:foody_customer_app/business_logic/view_models/baseModel.dart';
import 'package:foody_customer_app/constants/viewstate.dart';
import 'package:foody_customer_app/services/authentication_service.dart';

class VerifyOtpViewModel extends BaseModel {

  final _authenticationService = AuthenticationService();
  bool hasError;
  String errorMessage;

  VerifyOtpViewModel()  {
    hasError = false;
  }

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    setState(ViewState.Busy);
    try {
      TokenResponse response = await _authenticationService.getTokenByOtp(phoneNumber, otp);
      hasError = false;
      return true;
    } catch (e) {
      errorMessage = e.toString();
      hasError = true;
      setState(ViewState.Idle);
      return false;
    }

  }
}