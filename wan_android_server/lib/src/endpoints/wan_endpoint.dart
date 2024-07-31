import 'package:serverpod/serverpod.dart';
import 'package:wan_android_shared/wan_android_shared.dart';

class WanEndpoint extends Endpoint {
  Future<ApiResponse> helloWorld(Session session, String name) async {
    return ApiResponse(msg: "请求成功", code: 200, data: "成功数据");
  }
}
