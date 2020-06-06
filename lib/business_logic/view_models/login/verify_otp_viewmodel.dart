import 'package:foody_customer_app/business_logic/models/remote/authentication/token_response.dart';
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

  Future<bool> verifyOtp(String phoneNumber, String otp) async {
    setState(ViewState.Busy);
    try {
      await _authenticationRepository.getTokenByOtp(phoneNumber, otp);
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