import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';

class MineView extends StatefulWidget {
    @override
    _MineViewState createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
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
                        Strings.MINE,
                        textAlign: TextAlign.center,
                    )],
                )
            ),
        );
    }
}