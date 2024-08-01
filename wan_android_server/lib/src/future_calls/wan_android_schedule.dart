import 'dart:convert';

import 'package:http/http.dart';
import 'package:serverpod/serverpod.dart';
import 'package:wan_android_server/src/generated/banner_model.dart';
import 'package:wan_android_server/src/models/wan_android_response.dart';

import 'wan_android_api.dart';

final api = WanAndroidApi();

class WanAndroidSchedule extends FutureCall {
  @override
  Future<void> invoke(Session session, SerializableModel? object) async {
    print("--------> WanAndroidSchedule 我被调用了");

    /// 定时请求三方数据并且保存到数据库
    /// 每天更新一次
    try {
      api.fetchBanner().then((response) {
        final banners = _convert<List>(response)?.map((e) {
          final banner = BannerModel.fromJson(e);

          BannerModel.db.insertRow(session, banner);
        }).toList();

        // print(banners);
        //
        // if (banners != null && banners.isNotEmpty) {
        //   BannerModel.db.insert(session, banners);
        // }
      });
    } catch (e) {
      print(e.toString());
    }
  }

  fetchBanner(session) {
    api.fetchBanner().then((response) {
      final banners = _convert<List>(response)?.map((e) {
        final banner = BannerModel.fromJson(e);

        BannerModel.db.insertRow(session, banner);
      }).toList();

      // print(banners);
      //
      // if (banners != null && banners.isNotEmpty) {
      //   BannerModel.db.insert(session, banners);
      // }
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
