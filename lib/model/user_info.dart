import 'package:flutter/material.dart';

class UserInfoModel with ChangeNotifier {
  updateInfo() {
    print(
        "========================UserInfoModel updateInfo===================");
    notifyListeners();
  }
}
