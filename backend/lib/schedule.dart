import 'dart:async';

/// 调度
class Schedule {
  static const baseUrl = "https://www.wanandroid.com/";

  /// 获取banner
  static const String banner = "banner/json";

  Timer? timer;

  void start() {
    timer =
        Timer.periodic(Duration(seconds: 5), (timer) => fetchWanAndroidApi());
  }

  void stop() {
    timer?.cancel();
  }

  /// 后台加载数据
  void fetchWanAndroidApi() {
    print("定时器开启");

    fetchBanner();
  }

  void fetchBanner() {}
}
