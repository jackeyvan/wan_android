import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wan_android_backend/constant.dart';
import 'package:wan_android_backend/hive_box.dart';

class BaseResponse {
  String? errorMsg;
  int? errorCode;
  dynamic data;

  bool get success => errorCode == 0;

  BaseResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
    data = json['data'];
  }
}

/// 调度
class Schedule {
  static const baseUrl = "https://www.wanandroid.com/";

  /// 获取banner
  static const String banner = "${baseUrl}banner/json";

  Timer? timer;

  void start() {
    timer =
        Timer.periodic(Duration(seconds: 15), (timer) => fetchWanAndroidApi());

    // sleep(Duration(seconds: 5));
  }

  void stop() {
    timer?.cancel();
  }

  /// 后台加载数据
  void fetchWanAndroidApi() {
    print("定时器开启");

    fetchBanner();
  }

  void fetchBanner() {
    http.get(Uri.parse(banner)).then((response) {
      if (response.statusCode == 200) {
        print(response.body);

        final apiResponse = BaseResponse.fromJson(jsonDecode(response.body));
        if (apiResponse.success) {
          HiveBox.put(Constant.keyBanner, jsonEncode(apiResponse.data));
        }
      }
    });
  }
}
