import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/api/base_api.dart';
import 'package:wan_android_backend/repository/repository.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理

class BannerApi extends BaseApi {
  @Route.get('/')
  Future<Response?> fetchBanner(Request request) async {
    final result = await Repository.fetchBanner();
    return ok(result);
  }

  Router get router => _$BannerApiRouter(this);
}
