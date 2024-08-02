import 'dart:convert';

import 'package:http/http.dart';
import 'package:serverpod/serverpod.dart';
import 'package:wan_android_server/src/models/wan_android_response.dart';

import '../generated/protocol.dart';
import 'wan_android_api.dart';

final api = WanAndroidApi();

class WanAndroidSchedule extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    print("WanAndroidSchedule: WanAndroidSchedule has bean invoke.");

    /// 定时请求三方数据并且保存到数据库
    /// 每天更新一次
    // fetchBanner(session);

    BannerModel.db.insert(session,
        [BannerModel(title: "我是Banner标题1"), BannerModel(title: "我是Banner标题2")]);
  }

  fetchBanner(session) {
    api.fetchBanner().then((response) {
      final banners = _convert<List>(response)
          ?.map((e) => BannerModel.fromJson(e))
          .toList();
      if (banners != null && banners.isNotEmpty) {
        BannerModel.db.insert(session, banners);
      }
    }).catchError((e, s) {
      print("WanAndroidSchedule: fetchBanner happened a error.");
    });
  }

  T? _convert<T>(Response response) {
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final result = WanAndroidResponse.fromJson(json);

      if (result.errorCode == 0) {
        /// 请求成功
        return result.data;
      }
    }
    return null;
  }
}
