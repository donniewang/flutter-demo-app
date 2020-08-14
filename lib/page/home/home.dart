import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';

class HomeView extends StatefulWidget {
    @override
    _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    @override
    void initState() {
        super.initState();
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                color: Color(0xFFFFFFFF),
                alignment: FractionalOffset.center,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text(
                        Strings.HOME,
                        textAlign: TextAlign.center,
                    )],
                )
            ),
        );
    }
}