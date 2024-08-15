import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/constant.dart';
import 'package:wan_android_backend/database.dart';

part 'banner.g.dart';

class BannerModel {
  String? imagePath;
  String? title;
  String? url;
}

class BannerApi {
  @Route.get('/banner/')
  Future<Response> fetchBanner(Request request) async {
    final result = Storage.read(Constant.keyBanner);
    return Response.ok(json.encode(result),
        headers: {'Content-Type': 'application/json'});
  }

  Router get router => _$BannerApiRouter(this);
}
