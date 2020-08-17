import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';
import 'package:zdp/utils/navigator_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      NavigatorUtils.goMainPage(context);
    });
    _clearToken();
  }

  _clearToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(Strings.TOKEN_KEY);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFFB7E00),
          alignment: FractionalOffset.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.SPLASH,
                textAlign: TextAlign.center,
              )
            ],
          )),
    );
  }
}
