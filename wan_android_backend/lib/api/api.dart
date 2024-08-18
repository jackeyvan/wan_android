import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/repository/repository.dart';

part 'api.g.dart';

/// 使用`dart run build_runner build` 可以自动生成.g代码
/// 所有API在这个文件进行管理
/// 如果本地和三方都失败，则使用成功状态，但是body没有数据

class V1Api {
  @Route.get('/banner')
  Future<Response> fetchBanner(Request request) async {
    return Response.ok((await Repository.fetchBanner()).body);
  }

  @Route.get('/article/top')
  Future<Response> fetchTopArticle(Request request) async {
    return Response.ok((await Repository.fetchTopArticle()).body);
  }

  @Route.get('/article/list/<page>')
  Future<Response> fetchHomePageArticle(Request request, String page) async {
    return Response.ok((await Repository.fetchHomePageArticle(page)).body);
  }

  @Route.get('/platform/list/<id>/<page>')
  Future<Response> fetchPlatformList(
      Request request, String id, String page) async {
    return Response.ok((await Repository.fetchPlatformList(id, page)).body);
  }

  @Route.get('/platform/tabs')
  Future<Response> fetchPlatformTabs(Request request) async {
    return Response.ok((await Repository.fetchPlatformTabs()).body);
  }

  @Route.get('/project/tabs')
  Future<Response> fetchProjectTabs(Request request) async {
    return Response.ok((await Repository.fetchProjectTabs()).body);
  }

  @Route.get('/project/list/<id>/<page>')
  Future<Response> fetchProjectList(
      Request request, String id, String page) async {
    return Response.ok((await Repository.fetchProjectList(id, page)).body);
  }

  @Route.get('/navi/list')
  Future<Response> fetchNaviList(Request request) async {
    return Response.ok((await Repository.fetchNaviList()).body);
  }

  @Route.get('/tree/list')
  Future<Response> fetchTreeList(Request request) async {
    return Response.ok((await Repository.fetchTreeList()).body);
  }

  @Route.get('/tree/detail/list/<id>/<page>')
  Future<Response> fetchTreeDetailList(
      Request request, String id, String page) async {
    return Response.ok((await Repository.fetchTreeDetailList(id, page)).body);
  }

  @Route.get('/point/rank/<page>')
  Future<Response> fetchPointRank(Request request, String page) async {
    return Response.ok((await Repository.fetchPointRank(page)).body);
  }

  @Route.get('/hotkey')
  Future<Response> fetchHotKeywords(Request request) async {
    return Response.ok((await Repository.fetchHotKeywords()).body);
  }

  @Route.post('/search/<page>')
  Future<Response> fetchSearchResult(Request request, String page) async {
    final params = jsonDecode(await request.readAsString());
    final query = params["query"];
    return Response.ok((await Repository.fetchSearchResult(query, page)).body);
  }

  @Route.post('/user/login')
  Future<Response> login(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final username = params["username"];
    final password = params["password"];

    final resp = await Repository.login(username, password);

    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/logout')
  Future<Response> logout(Request request) async {
    final resp = await Repository.logout(header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.post('/user/register')
  Future<Response> register(Request request) async {
    final params = jsonDecode(await request.readAsString());
    final username = params["username"];
    final password = params["password"];
    final rePassword = params["rePassword"];

    final resp = await Repository.register(username, password, rePassword);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/points/<page>')
  Future<Response> fetchCoinList(Request request, String page) async {
    final resp = await Repository.fetchCoinList(page, header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/info')
  Future<Response> fetchUserInfo(Request request) async {
    print("header: ${request.headers}");
    final resp = await Repository.fetchUserInfo(header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/collect/list/<page>')
  Future<Response> fetchUserCollection(Request request, String page) async {
    final resp =
        await Repository.fetchUserCollection(page, header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/collect/<id>')
  Future<Response> collectArticle(Request request, String id) async {
    final resp = await Repository.collectArticle(id, header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  @Route.get('/user/un_collect/<id>')
  Future<Response> unCollectArticle(Request request, String id) async {
    final resp = await Repository.unCollectArticle(id, header: request.headers);
    return Response.ok(resp.body, headers: _handleHeader(resp.headers));
  }

  Map<String, Object> _handleHeader(Map<String, String>? header) {
    var result = <String, Object>{};
    if (header?.containsKey('set-cookie') ?? false) {
      result['set-cookie'] = header!['set-cookie'] as Object;
    }
    return result;
  }

  Router get router => _$V1ApiRouter(this);
}
