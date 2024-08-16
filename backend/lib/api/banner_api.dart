import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/api/base_api.dart';
import 'package:wan_android_backend/repository/repository.dart';

part 'banner_api.g.dart';

class BannerApi extends BaseApi {
  @Route.get('/')
  Future<Response?> fetchBanner(Request request) async {
    final result = await Repository.fetchBanner();
    return ok(result);
  }

  Router get router => _$BannerApiRouter(this);
}
