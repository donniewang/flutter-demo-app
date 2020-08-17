import 'package:dio/dio.dart';
import 'package:zdp/api/api.dart';
import 'package:zdp/utils/http_util.dart';
import 'package:zdp/constant/string.dart';
import 'dart:convert';

typedef OnSuccess<T>(T data);

typedef OnFail(String message);

class UserService {
  Future login(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.LOGIN_URL,
          parameters: parameters,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      Map responseMap = jsonDecode(response);
      if (responseMap['success']) {
        onSuccess(responseMap);
      } else {
        onFail(response['message']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future sendSms(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.post(Api.SEND_CODE_URL,
          parameters: parameters,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      Map responseMap = jsonDecode(response);
      if (responseMap['success']) {
        onSuccess(responseMap);
      } else {
        onFail(response['message']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }

  Future validateAccount(Map<String, dynamic> parameters, OnSuccess onSuccess,
      OnFail onFail) async {
    try {
      var response = await HttpUtil.instance.get(Api.VALIDATE_ACCOUNT_URL,
          parameters: parameters,
          options: Options(contentType: Headers.formUrlEncodedContentType));
      Map responseMap = jsonDecode(response);
      if (responseMap['success']) {
        onSuccess(responseMap);
      } else {
        onFail(response['message']);
      }
    } catch (e) {
      print(e);
      onFail(Strings.SERVER_EXCEPTION);
    }
  }
}
