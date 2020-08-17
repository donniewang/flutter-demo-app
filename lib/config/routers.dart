import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:zdp/page/splash/splash.dart';
import 'package:zdp/page/home/main.dart';
import 'package:zdp/page/login/login.dart';

class Routers {
  static String root = "/";
  static String main = "/main";
  static String login = "/login";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not found");
    });

    router.define(root, handler: Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      return SplashView();
    }));

    router.define(login, handler: Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      return LoginView();
    }));

    router.define(main, handler: Handler(handlerFunc:
        (BuildContext context, Map<String, List<String>> parameters) {
      return MainView();
    }));
  }
}
