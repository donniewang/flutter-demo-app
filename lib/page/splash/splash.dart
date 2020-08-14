import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';
import 'package:zdp/utils/navigator_util.dart';

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
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                color: Color(0xFFFB7E00),
                alignment: FractionalOffset.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                        Strings.SPLASH,
                        textAlign: TextAlign.center,
                    )],
                )
            ),
        );
    }
}