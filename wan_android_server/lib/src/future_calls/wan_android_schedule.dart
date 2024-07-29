import 'package:serverpod/serverpod.dart';

import 'wan_android_api.dart';

final api = WanAndroidApi();

class WanAndroidSchedule extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    print("--------> WanAndroidSchedule 我被调用了");

    /// 请求三方数据并且保存到数据库
  }
}
