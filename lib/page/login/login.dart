import 'package:flutter/material.dart';
import 'package:zdp/constant/string.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zdp/service/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zdp/event/login_event.dart';
import 'package:zdp/utils/shared_preferences_util.dart';
import 'dart:async';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController mobileTextController = TextEditingController();
  TextEditingController vcodeTextController = TextEditingController();

  UserService userService = UserService();

  bool treatyChecked = false;
  String token = '';

  Timer sentTimer;
  int sentTime = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getLogoView(),
          getLoginView(),
        ],
      ))),
    );
  }

  Widget getLogoView() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * .45,
        decoration: BoxDecoration(
            image: new DecorationImage(
          image: AssetImage("images/loginbg.jpg"),
          fit: BoxFit.fill,
        )),
        child: Column(children: [
          Container(height: 70),
          Container(
            padding: EdgeInsets.only(left: 50.0, right: 50),
            child: Image.asset(
              "images/logo.png",
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 50.0, right: 50, bottom: 80),
            child: Text(Strings.LOGO,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ]));
  }

  Widget getMobileInput() {
    return Container(
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xFFC3C3C3), width: 1),
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.circular((6.0)),
        ),
        padding: EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(left: 10, right: 20),
            child: Image.asset(
              "images/logininputicon.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
                controller: mobileTextController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入手机号",
                    hintStyle: TextStyle(
                      color: Color(0xFFC3C3C3),
                    ))),
          ),
        ]));
  }

  Widget getVcodeInput() {
    return Container(
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xFFC3C3C3), width: 1),
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.circular((6.0)),
        ),
        padding: EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(left: 10, right: 20),
            child: Image.asset(
              "images/logincodeicon.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            flex: 1,
            child: TextField(
                controller: vcodeTextController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "请输入验证码",
                    hintStyle: TextStyle(
                      color: Color(0xFFC3C3C3),
                    ))),
          ),
          Container(
            width: 1,
            height: 40,
            decoration: new BoxDecoration(
              color: Color(0xFFC3C3C3),
            ),
          ),
          Container(
            width: 120,
            height: 50,
            child: FlatButton(
              onPressed: _sendCode,
              child: sentTime <= 0
                  ? Text(Strings.SEND_VCODE,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFB7E00),
                        fontSize: 17.0,
                      ))
                  : Text("$sentTime",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFFB7E00),
                        fontSize: 17.0,
                      )),
            ),
          ),
        ]));
  }

  Widget getInvitationInput() {
    return Container(
        decoration: new BoxDecoration(
          border: new Border.all(color: Color(0xFFC3C3C3), width: 1),
          color: Color(0xFFFFFFFF),
          borderRadius: new BorderRadius.circular((6.0)),
        ),
        padding: EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(width: 15, height: 30),
          Expanded(
            flex: 1,
            child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "薪用户请输入邀请码",
                    hintStyle: TextStyle(
                      color: Color(0xFFC3C3C3),
                    ))),
          ),
          Container(
            width: 1,
            height: 40,
            decoration: new BoxDecoration(
              color: Color(0xFFC3C3C3),
            ),
          ),
          Container(
            width: 120,
            height: 50,
            child: FlatButton(
              onPressed: _invitation,
              child: Text("预约邀请码",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF8F8F8F),
                    fontSize: 17.0,
                  )),
            ),
          ),
        ]));
  }

  Widget getTreatyCheckBox() {
    return Container(
        padding: EdgeInsets.all(5),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          treatyChecked == true
              ? InkWell(
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(left: 0, right: 10),
                    child: Image.asset(
                      "images/agree_act.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      treatyChecked = false;
                    });
                  })
              : InkWell(
                  child: Container(
                    width: 24,
                    height: 24,
                    margin: EdgeInsets.only(left: 0, right: 10),
                    child: Image.asset(
                      "images/agree.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      treatyChecked = true;
                    });
                  }),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(Strings.TREATY,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14.0,
                  )),
            ),
          ),
        ]));
  }

  Widget getLoginButton() {
    return Container(
      color: Color(0xFFFFFFFF),
      child: ConstrainedBox(
        constraints: BoxConstraints.expand(height: 55.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: _login,
          textColor: Colors.white,
          child: Text(Strings.LOGIN,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 10,
              )),
        ),
      ),
    );
  }

  Widget getLoginText() {
    return Container(
        color: Color(0xFFFFFFFF),
        child: Text("若您未注册，登录即注册",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black26,
              fontSize: 14.0,
              letterSpacing: 2,
            )));
  }

  Widget getLoginView() {
    return Container(
        padding: EdgeInsets.only(left: 40.0, right: 40, top: 10),
        color: Color(0xFFFFFFFF),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            getMobileInput(),
            Container(height: 20),
            getVcodeInput(),
            Container(height: 20),
            getInvitationInput(),
            Container(height: 20),
            getTreatyCheckBox(),
            Container(height: 15),
            getLoginButton(),
            Container(height: 15),
            getLoginText(),
          ],
        ));
  }

  _login() {
    if (mobileTextController.text == null ||
        mobileTextController.text.length == 0) {
      _showToast("手机号不能为空！");
      return;
    }
    if (vcodeTextController.text == null ||
        vcodeTextController.text.length == 0) {
      _showToast("请输入验证码！");
      return;
    }
    if (!treatyChecked) {
      _showToast("请勾选合同条款！");
      return;
    }
    Map<String, dynamic> map = Map();
    map.putIfAbsent("account", () => mobileTextController.text.toString());
    userService.validateAccount(map, (data) {
      print(data);
      _showToast('登录成功！');
      setState(() {
        token = "test";
      });
      _saveUserInfo();
      // loginEventBus.fire(LoginEvent(true, ""));
      Navigator.of(context).pop(true);
    }, (message) {
      print(message);
      _showToast(message);
    });
  }

  _sendCode() {
    if (mobileTextController.text == null ||
        mobileTextController.text.length == 0) {
      _showToast("手机号不能为空！");
      return;
    }
    Map<String, dynamic> map = Map();
    map.putIfAbsent("mobile", () => mobileTextController.text.toString());
    userService.sendSms(map, (data) {
      _showToast('验证码发送成功！');
      setState(() {
        sentTime = 120;
      });
      _startTimer();
    }, (message) {
      print(message);
      _showToast(message);
    });
  }

  _invitation() {}

  _startTimer() {
    const oneSec = const Duration(seconds: 1);
    var callback = (timer) => {
          setState(() {
            if (sentTime < 1) {
              sentTimer.cancel();
            } else {
              sentTime = sentTime - 1;
            }
          })
        };
    sentTimer = Timer.periodic(oneSec, callback);
  }

  _showToast(message) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color(0xFFFB7E00),
        textColor: Colors.white,
        fontSize: 16);
  }

  _saveUserInfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    SharedPreferencesUtils.token = token;
    await sharedPreferences.setString(Strings.TOKEN_KEY, token);
  }

  @override
  void dispose() {
    super.dispose();
    if (sentTimer != null) {
      sentTimer.cancel();
    }
  }
}
