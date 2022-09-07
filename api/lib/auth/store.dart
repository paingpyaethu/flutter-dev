import 'package:flutter/foundation.dart';

class Store extends ChangeNotifier {
  String api = "";

  void setApi(String str) {
    this.api = str;
  }

  String getApi() {
    return this.api;
  }
}
