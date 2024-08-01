import 'dart:convert';

class WanAndroidResponse {
  String? errorMsg;
  int? errorCode;
  dynamic data;

  WanAndroidResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    return {
      "errorCode": errorCode,
      "errorMsg": errorMsg,
      "data": data,
    };
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
