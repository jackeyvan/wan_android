import 'package:flutter_wan_android/core/init/build_env.dart';
import 'package:flutter_wan_android/core/init/storage.dart';
import 'package:flutter_wan_android/core/init/themes.dart';
import 'package:flutter_wan_android/core/utils/log_utils.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

/// 封装过的父类
abstract class Service extends GetxService {
  void init();

  /// 第一次初始化相关服务
  dependencies() async {
    /// 初始化环境
    Get.put(BuildEnv.dev());

    /// 初始化日志
    Get.put(Logger(printer: PrettyPrinter(), filter: DefaultFilter()),
        permanent: true);

    /// 初始化本地存储
    await Storage.init();

    /// 初始化主题
    AppTheme.changeTheme();

    /// 子类再去初始化
    init();
  }
}
