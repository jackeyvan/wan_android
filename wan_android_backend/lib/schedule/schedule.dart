import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:wan_android_backend/repository/repository.dart';

class WanResponse {
  int code;
  dynamic data;

  WanResponse({required this.code, this.data});

  bool get success => code == 0;

  factory WanResponse.fromJson(dynamic json) {
    return WanResponse(code: json["errorCode"], data: json["data"]);
  }
}

/// 调度
class Schedule {
  Timer? timer;

  /// 默认爬取的页树木
  final prePage = 3;

  void start() {
    timer = Timer.periodic(Duration(days: 1), (timer) => fetchWanAndroidApi());
    Future.delayed(Duration(seconds: 5), () => fetchWanAndroidApi());
  }

  void stop() {
    timer?.cancel();
  }

  /// 后台加载数据
  void fetchWanAndroidApi() {
    final forceRemote = true;

    Repository.fetchBanner(force: true);

    sleep(Duration(minutes: 1));

    Repository.fetchTopArticle(force: true);

    sleep(Duration(minutes: 1));

    /// 首页文章
    for (var page = 0; page <= prePage; page++) {
      Repository.fetchHomePageArticle("$page", force: true);
      sleep(Duration(seconds: 10));
    }

    sleep(Duration(minutes: 10));

    /// 公众号
    Repository.fetchPlatformTabs(force: forceRemote).then((value) {
      final result = WanResponse.fromJson(jsonDecode(value.body));
      if (result.success) {
        (result.data as List).map((e) {
          for (var page = 1; page <= prePage; page++) {
            Repository.fetchPlatformList("${e['id']}", "$page",
                force: forceRemote);
            sleep(Duration(seconds: 10));
          }
        }).toList();
      }
    }).catchError((e, s) {
      print(e.toString());
    });

    sleep(Duration(minutes: 10));

    /// 项目
    Repository.fetchProjectTabs(force: forceRemote).then((value) {
      final result = WanResponse.fromJson(jsonDecode(value.body));
      if (result.success) {
        (result.data as List).map((e) {
          for (var page = 1; page <= prePage; page++) {
            Repository.fetchProjectList("${e['id']}", "$page",
                force: forceRemote);
            sleep(Duration(seconds: 10));
          }
        }).toList();
      }
    }).catchError((e, s) {
      print(e.toString());
    });

    sleep(Duration(minutes: 10));

    /// 导航
    Repository.fetchNaviList(force: forceRemote);

    sleep(Duration(minutes: 1));

    /// 体系数据
    Repository.fetchTreeList(force: forceRemote).then((value) {
      final result = WanResponse.fromJson(jsonDecode(value.body));
      if (result.success) {
        (result.data as List).map((e) {
          (e["children"] as List).map((child) {
            Repository.fetchTreeDetailList("${child['id']}", "0",
                force: forceRemote);
            sleep(Duration(seconds: 10));
          }).toList();
        }).toList();
      }
    }).catchError((e, s) {
      print(e.toString());
    });

    sleep(Duration(minutes: 10));

    /// 搜索，并根据热搜词
    Repository.fetchHotKeywords(force: forceRemote).then((value) {
      final result = WanResponse.fromJson(jsonDecode(value.body));

      if (result.success) {
        (result.data as List).map((e) {
          Repository.fetchSearchResult(e['name'], "0");
          sleep(Duration(seconds: 10));
        }).toList();
      }
    }).catchError((e, s) {
      print(e.toString());
    });
  }
}
