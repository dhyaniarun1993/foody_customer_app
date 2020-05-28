import 'package:flutter/foundation.dart';
import 'package:foody_customer_app/constants/viewstate.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState getState() {
   return _state;
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}