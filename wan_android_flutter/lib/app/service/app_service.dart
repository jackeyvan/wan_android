import 'package:flutter_wan_android/app/api/pgyer_api.dart';
import 'package:flutter_wan_android/app/api/wan_android_api.dart';
import 'package:flutter_wan_android/core/init/init_service.dart';
import 'package:get/get.dart';

/// 业务层初始化
class AppService extends Service {
  @override
  Future<void> init() async {
    /// 本地网络框架，每个url对应一个Provider
    /// 玩安卓API
    Get.put(WanAndroidApi(), permanent: true);
    Get.put(PgyerApi(), permanent: true);

    /// WebView相关配置
    // InAppWebViewController.setWebContentsDebuggingEnabled(false);
  }
}
