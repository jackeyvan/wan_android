import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/api/base_api.dart';
import 'package:wan_android_backend/repository/repository.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理
/// 如果本地和三方都失败，则使用成功状态，但是body没有数据

class V1Api extends BaseApi {
  @Route.get('/banner')
  Future<Response> fetchBanner(Request request) async {
    return ok(await Repository.fetchBanner());
  }

  @Route.get('/article/top')
  Future<Response> fetchTopArticle(Request request) async {
    return ok(await Repository.fetchTopArticle());
  }

  @Route.get('/article/list/<page>')
  Future<Response> fetchHomePageArticle(Request request, String page) async {
    return ok(await Repository.fetchHomePageArticle(page));
  }

  @Route.get('/wxarticle/list/<id>/<page>')
  Future<Response> fetchPlatformList(
      Request request, String id, String page) async {
    return ok(await Repository.fetchPlatformList(id, page));
  }

  @Route.get('/wxarticle/chapters')
  Future<Response> fetchPlatformTabs(Request request) async {
    return ok(await Repository.fetchPlatformTabs());
  }

  @Route.get('/project/tabs')
  Future<Response> fetchProjectTabs(Request request) async {
    return ok(await Repository.fetchProjectTabs());
  }

  @Route.get('/project/list/<id>/<page>')
  Future<Response> fetchProjectList(
      Request request, String id, String page) async {
    return ok(await Repository.fetchProjectList(id, page));
  }

  @Route.get('/navi/tabs')
  Future<Response> fetchNaviTabs(Request request) async {
    return ok(await Repository.fetchNaviTabs());
  }

  @Route.get('/tree/tabs')
  Future<Response> fetchTreeTabs(Request request) async {
    return ok(await Repository.fetchTreeTabs());
  }

  @Route.get('/tree/list/<id>/<page>')
  Future<Response> fetchTreeList(
      Request request, String id, String page) async {
    return ok(await Repository.fetchTreeList(id, page));
  }

  @Route.get('/hotkey')
  Future<Response> fetchHotKeywords(Request request) async {
    return ok(await Repository.fetchHotKeywords());
  }

  Router get router => _$V1ApiRouter(this);
}
