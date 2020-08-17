import 'dart:convert';

class JsonConvertUtil {
  static String objecttToString<T>(T t) {
    return fluroCnParamsEncode(jsonEncode(t));
  }

  static Map<String, dynamic> stringToMap(String str) {
    return json.decode(fluroCnParamsDecode(str));
  }

  static String fluroCnParamsEncode(String originalCn) {
    return jsonEncode(Utf8Encoder().convert(originalCn));
  }

  static String fluroCnParamsDecode(String encodeCn) {
    var list = List<int>();
    jsonDecode(encodeCn).forEach(list.add);
    String value = Utf8Decoder().convert(list);
    return value;
  }
}
