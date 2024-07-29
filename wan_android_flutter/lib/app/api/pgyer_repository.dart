import 'package:flutter_wan_android/app/modules/entity/app_info_entity.dart';
import 'package:get/get.dart';

import 'pgyer_api.dart';

class PgyerApiPaths {
  static const baseUrl = "https://www.pgyer.com/apiv2/";

  /// APP信息
  static const appInfo = "app/view";

  /// 检查更新
  static const appCheck = "app/check";
}

class PgyerRepository {
  static final _api = Get.find<PgyerApi>();

  static Future<AppInfoEntity?> appInfo() {
    return _api.post<AppInfoEntity>(PgyerApiPaths.appInfo);
  }
}
