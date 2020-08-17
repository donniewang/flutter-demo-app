import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zdp/config/application.dart';
import 'package:zdp/config/routers.dart';

class NavigatorUtils {
  static goMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.main,
        transition: TransitionType.inFromRight, replace: true);
  }

  static goLoginPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.login,
        transition: TransitionType.inFromBottom);
  }
}
