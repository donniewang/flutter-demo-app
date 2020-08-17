import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zdp/config/routers.dart';
import 'package:zdp/config/application.dart';
import 'package:zdp/model/user_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    builder: (context) => UserInfoModel(),
    child: ZdpApp(),
  ));
}

class ZdpApp extends StatelessWidget {
  ZdpApp() {
    final router = Router();
    Routers.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      title: 'ZDP-Demo',
      theme: ThemeData(primaryColor: Color(0xFFFB7E00)),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('zh'),
    );
  }
}
