import 'dart:async';
import 'dart:io';

import 'package:wan_android_backend/repository/repository.dart';

class WanResponse {
  int code;
  dynamic data;

  WanResponse({required this.code, this.data});

  bool get success => code == 0;

  factory WanResponse.fromJson(dynamic json) {
    return WanResponse(code: json["code"], data: json["data"]);
  }
}

/// 调度
class Schedule {
  Timer? timer;

  /// 默认爬取的页树木
  final prePage = 5;

  void start() {
    timer = Timer.periodic(Duration(days: 1), (timer) => fetchWanAndroidApi());
    Future.delayed(Duration(seconds: 10), () => fetchWanAndroidApi());
  }

  void stop() {
    timer?.cancel();
  }

  /// 后台加载数据
  void fetchWanAndroidApi() {
    Repository.fetchBanner(force: true);
    Repository.fetchTopArticle(force: true);

    /// 有页码的更新
    for (var page = 0; page < prePage; page++) {
      Repository.fetchHomePageArticle("$page", force: true);
      sleep(Duration(seconds: 1));
    }

    /// 公众号
    Repository.fetchPlatformTabs(force: true);

    /// 项目
    Repository.fetchProjectTabs(force: true);

    /// 导航
    Repository.fetchNaviList(force: true);

    /// 体系
    Repository.fetchTreeList(force: true);

    /// 搜索，并根据热搜词
    Repository.fetchHotKeywords(force: true);
  }
}
