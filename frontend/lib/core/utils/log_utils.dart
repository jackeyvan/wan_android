import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../init/build_env.dart';

class LogUtils {
  static final _logger = Get.find<Logger>();

  /// 常规日志，不跟环境，直接打印
  static void log(dynamic msg) => _logger.i(msg);

  static void i(dynamic msg) {
    if (enableLog) _logger.i(msg);
  }

  static void d(dynamic msg) {
    if (enableLog) _logger.d(msg);
  }

  static void e(dynamic msg) {
    if (enableLog) _logger.e(msg);
  }

  static void w(dynamic msg) {
    if (enableLog) _logger.w(msg);
  }

  static bool get enableLog => Get.find<BuildEnv>().enableLog();
}

class DefaultFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return LogUtils.enableLog;
  }
}
