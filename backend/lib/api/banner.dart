import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/const/constant.dart';
import 'package:wan_android_backend/db/hive_box.dart';

part 'banner.g.dart';

class BannerModel {
  String? imagePath;
  String? title;
  String? url;
}

class BannerApi {
  @Route.get('/')
  Future<Response> fetchBanner(Request request) async {
    final result = HiveBox.get(Constant.keyBanner);

    if (result != null) {
      /// 直接解析
      print(result);
    }

    return Response.ok(result, headers: {'Content-Type': 'application/json'});
  }

  Router get router => _$BannerApiRouter(this);
}
