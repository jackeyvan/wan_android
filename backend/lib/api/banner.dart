import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'banner.g.dart';

class BannerModel {
  String? imagePath;
  String? title;
  String? url;
}

class BannerApi {
  @Route.get('/')
  Future<Response> fetchBanner(Request request) async {
    // final result = Storage.read(Constant.keyBanner);
    return Response.ok(json.encode("{我是banner}"),
        headers: {'Content-Type': 'application/json'});
  }

  Router get router => _$BannerApiRouter(this);
}
