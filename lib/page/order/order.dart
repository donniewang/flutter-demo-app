import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';

class OrderView extends StatefulWidget {
    @override
    _OrderViewState createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
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
                        Strings.ORDER,
                        textAlign: TextAlign.center,
                    )],
                )
            ),
        );
    }
}