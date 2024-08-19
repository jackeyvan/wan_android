import 'dart:async';
import 'dart:convert';

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
  final forceRemote = true;

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
  void fetchWanAndroidApi() async {
    /// 首页Banner
    Future.delayed(
        Duration(minutes: 1), () => Repository.fetchBanner(force: forceRemote));

    /// 首页置顶文章
    Future.delayed(Duration(minutes: 2),
        () => Repository.fetchTopArticle(force: forceRemote));

    /// 首页热门文章
    Future.delayed(Duration(minutes: 5), () {
      for (var page = 0; page <= prePage; page++) {
        Future.delayed(Duration(seconds: (page + 1) * 10),
            () => Repository.fetchHomePageArticle("$page", force: forceRemote));
      }
    });

    /// 公众号
    Future.delayed(Duration(minutes: 10), () {
      Repository.fetchPlatformTabs(force: forceRemote).then((value) {
        handleFutureResult(type: 1, body: value.body, initPage: 1, tag: "id");
      }).catchError((e, s) {
        print(e.toString());
      });
    });

    /// 项目
    Future.delayed(Duration(minutes: 20), () {
      Repository.fetchProjectTabs(force: forceRemote).then((value) {
        handleFutureResult(type: 2, initPage: 1, body: value.body, tag: "id");
      }).catchError((e, s) {
        print(e.toString());
      });
    });

    /// 导航
    Future.delayed(Duration(minutes: 30),
        () => Repository.fetchNaviList(force: forceRemote));

    /// 体系数据
    Future.delayed(Duration(minutes: 40), () {
      Repository.fetchTreeList(force: forceRemote).then((value) {
        final result = WanResponse.fromJson(jsonDecode(value.body));
        if (result.success) {
          final data = result.data as List;
          data.forEach((e) {
            Future.delayed(Duration(seconds: (data.indexOf(e) + 1) * 10), () {
              final children = e["children"] as List;
              children.forEach((child) {
                Future.delayed(
                    Duration(seconds: (children.indexOf(child) + 1) * 10),
                    () => Repository.fetchTreeDetailList("${child['id']}", "0",
                        force: forceRemote));
              });
            });
          });
        }
      }).catchError((e, s) {
        print(e.toString());
      });
    });

    /// 搜索，并根据热搜词
    Future.delayed(Duration(minutes: 50), () {
      Repository.fetchHotKeywords(force: forceRemote).then((value) {
        final result = WanResponse.fromJson(jsonDecode(value.body));
        if (result.success) {
          final data = result.data as List;
          data.forEach((e) {
            Future.delayed(Duration(seconds: (data.indexOf(e) + 1) * 10),
                () => Repository.fetchSearchResult(e['name'], "0"));
          });
        }
      }).catchError((e, s) {
        print(e.toString());
      });
    });
  }

  /// 统一处理结果
  void handleFutureResult({
    required int type,
    required int initPage,
    required String body,
    required String tag,
  }) {
    final result = WanResponse.fromJson(jsonDecode(body));
    if (result.success) {
      final data = result.data as List;
      data.forEach((e) {
        Future.delayed(Duration(seconds: (data.indexOf(e) + 1) * 10), () {
          for (var page = initPage; page <= prePage; page++) {
            Future.delayed(Duration(seconds: page * 10), () {
              if (type == 1) {
                Repository.fetchPlatformList("${e[tag]}", "$page",
                    force: forceRemote);
              } else if (type == 2) {
                Repository.fetchProjectList("${e[tag]}", "$page",
                    force: forceRemote);
              }
            });
          }
        });
      });
    }
  }
}
