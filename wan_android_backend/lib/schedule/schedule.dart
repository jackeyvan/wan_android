import 'dart:async';

import 'package:wan_android_backend/repository/repository.dart';

/// 调度
class Schedule {
  Timer? timer;

  void start() {
    timer = Timer.periodic(Duration(hours: 1), (timer) => fetchWanAndroidApi());
    Future.delayed(Duration(seconds: 5), () => fetchWanAndroidApi());
  }

  void stop() {
    timer?.cancel();
  }

  /// 后台加载数据
  void fetchWanAndroidApi() {
    Repository.fetchBanner(force: true);
    Repository.fetchHomePageArticle(0.toString(), force: true);
    Repository.fetchTopArticle(force: true);
    Repository.fetchPlatformTabs(force: true);
    Repository.fetchProjectTabs(force: true);
    Repository.fetchNaviTabs(force: true);
    Repository.fetchTreeTabs(force: true);
    Repository.fetchHotKeywords(force: true);
  }
}
