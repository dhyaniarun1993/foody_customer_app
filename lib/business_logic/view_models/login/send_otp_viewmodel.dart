import 'package:foody_customer_app/business_logic/view_models/baseModel.dart';
import 'package:foody_customer_app/constants/viewstate.dart';
import 'package:foody_customer_app/repositories/authentication_repository.dart';

class SendOtpViewModel extends BaseModel {

  final _authenticationRepository = AuthenticationRepository();
  bool hasError;
  String errorMessage;

  SendOtpViewModel() {
    hasError = false;
  }

  Future<bool> sendOtp(String phoneNumber) async {
    setState(ViewState.Busy);

    try {
      await _authenticationRepository.sendOtp(phoneNumber);
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