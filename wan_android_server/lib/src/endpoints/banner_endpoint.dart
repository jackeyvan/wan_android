import 'package:serverpod/serverpod.dart';
import 'package:wan_android_shared/wan_android_shared.dart';

import '../generated/protocol.dart';

class BannerEndpoint extends Endpoint {
  Future<ApiResponse> fetchBanner(Session session) async {
    final banners = await BannerModel.db.find(session);
    return ApiResponse(msg: "请求成功", code: 200, data: banners);
  }

  Future<ApiResponse> insertBanner(Session session) async {
    final banner = BannerModel(title: "我是Banner");

    final insertBanner = await BannerModel.db.insertRow(session, banner);

    return ApiResponse(msg: "请求成功", code: 200, data: insertBanner);
  }
}
