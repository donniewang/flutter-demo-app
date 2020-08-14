import 'package:zdp/api/api.dart';
import 'package:zdp/utils/http_util.dart';
import 'package:zdp/constant/string.dart';

typedef OnSuccess<T>(T data);

typedef OnFail(String message);

class UserService {

    Future login(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
        try {
            var response = await HttpUtil.instance.post(Api.LOGIN_URL, parameters: parameters);
            if (response['errno'] == 0) {
                


                onSuccess({});
            } else {
                onFail(response['errmsg']);
            }
        } catch (e) {
            print(e);
            onFail(Strings.SERVER_EXCEPTION);
        }
    }

    Future sendSms(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
        try {
            var response = await HttpUtil.instance.post(Api.SEND_CODE_URL, parameters: parameters);
            if (response['errno'] == 0) {
                


                onSuccess({});
            } else {
                onFail(response['errmsg']);
            }
        } catch (e) {
            print(e);
            onFail(Strings.SERVER_EXCEPTION);
        }
    }

    Future validateAccount(Map<String, dynamic> parameters, OnSuccess onSuccess, OnFail onFail) async {
        try {
            var response = await HttpUtil.instance.post(Api.VALIDATE_ACCOUNT_URL, parameters: parameters);
            if (response['errno'] == 0) {
                


                onSuccess({});
            } else {
                onFail(response['errmsg']);
            }
        } catch (e) {
            print(e);
            onFail(Strings.SERVER_EXCEPTION);
        }
    }

}