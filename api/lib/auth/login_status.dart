import 'package:flutter/foundation.dart';

class LoginStatus extends ChangeNotifier {
  bool status = false;

  setStatus(bool val) {
    this.status = val;
    notifyListeners();
  }
}
