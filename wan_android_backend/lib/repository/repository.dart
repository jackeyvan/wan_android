import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:wan_android_backend/db/hive_box.dart';

class WanAndroidApiPaths {
  /// 基础url
  static const baseUrl = "https://www.wanandroid.com/";

  /// 文章列表
  static const String articleList = "${baseUrl}article/list/";

  /// 置顶文章
  static const String topArticle = "${baseUrl}article/top/json";

  /// 获取banner
  static const String banner = "${baseUrl}banner/json";

  /// 项目分类
  static const String projectCategory = "${baseUrl}project/tree/json";

  /// 项目列表
  static const String projectList = "${baseUrl}project/list/";

  /// 搜索
  static const String searchForKeyword = "${baseUrl}article/query/";

  /// 获取搜索热词
  static const String hotKeywords = "${baseUrl}hotkey/json";

  /// 点击收藏文章
  static const String collectArticle = "${baseUrl}lg/collect/";

  /// 取消收藏文章
  static const String unCollectArticle = "${baseUrl}lg/uncollected_originId/";

  /// 获取收藏文章列表
  static const String collectList = "${baseUrl}lg/collect/list/";

  /// 公众号
  static const String wxArticleTab = "${baseUrl}wxarticle/chapters/json";

  /// 某个公众号的文章列表  wxarticle/list/408/1/json
  static const String wxArticleList = "${baseUrl}wxarticle/list/";

  /// 学习体系
  static const String treeList = "${baseUrl}tree/json";

  /// 导航  navi/json
  static const String naviList = "${baseUrl}navi/json";

  /// 用户信息
  static const String userinfo = "${baseUrl}user/lg/userinfo/json";

  /// 个人积分列表
  static const String coinList = "${baseUrl}lg/coin/list/";

  /// 积分排行榜
  static const String coinRankList = "${baseUrl}coin/rank/";

  /// 登录
  static const String login = "${baseUrl}user/login";

  /// 注册
  static const String register = "${baseUrl}user/register";

  /// 退出登录
  static const String logout = "${baseUrl}user/logout/json";
}

/// =====================================================================================================================
/// 接口封装，提供玩安卓所有远程接口
/// =====================================================================================================================
class Repository {
  /// Get请求并且保存数据
  static Future<Response> get(String url, bool force,
      {Map<String, String>? header}) async {
    /// 先从本地取
    final result = HiveBox.get(url);

    /// 本地没有拉取远程
    if (result == null) {
      return _getCore(url, header);
    } else {
      /// 本地有的话，看数据强制读取
      if (force) {
        return _getCore(url, header);
      } else {
        // print("Local result = " + result);
        print("Local result ==== $url");
        return Response(result, 200, headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        });
      }
    }
  }

  /// Post请求并且保存数据
  static Future<Response> post(String url,
      {Map<dynamic, dynamic>? params, Map<String, String>? header}) {
    String path = "";
    params?.forEach((key, value) {
      path += key + "=" + value + "&";
    });

    if (path.isNotEmpty) {
      path = path.substring(0, path.length - 1);
      url = "$url?$path";
    }

    return http.post(Uri.parse(url), headers: header).then((response) {
      print("Post request result = " + response.body);
      print("Post request ===== $url");
      return response;
    }).catchError((e, s) {
      print(e.toString());
      return Response(e.toString(), -1000);
    });
  }

  static Future<Response> _getCore(
      String url, Map<String, String>? header) async {
    return http.get(Uri.parse(url), headers: header).then((response) {
      print("Get request result" + response.body);
      print("Get request ===== $url");
      HiveBox.put(url, response.body);
      return response;
    }).catchError((e, s) {
      print(e.toString());
      return Response(e.toString(), -1000);
    });
  }

  /// Banner数据
  static Future<Response> fetchBanner({bool force = false}) =>
      get(WanAndroidApiPaths.banner, force);

  /// 首页文章
  static Future<Response> fetchHomePageArticle(String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.articleList}$page/json", force);

  ///  置顶文章
  static Future<Response> fetchTopArticle({bool force = false}) =>
      get(WanAndroidApiPaths.topArticle, force);

  /// 公众号列表
  static Future<Response> fetchPlatformList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.wxArticleList}$id/$page/json", force);

  /// 公众号Tab
  static Future<Response> fetchPlatformTabs({bool force = false}) =>
      get(WanAndroidApiPaths.wxArticleTab, force);

  /// 项目Tab
  static Future<Response> fetchProjectTabs({bool force = false}) =>
      get(WanAndroidApiPaths.projectCategory, force);

  /// 项目列表
  static Future<Response> fetchProjectList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.projectList}$page/json?cid=$id", force);

  /// 导航系列数据
  static Future<Response> fetchNaviList({bool force = false}) =>
      get(WanAndroidApiPaths.naviList, force);

  /// 学习体系系列数据
  static Future<Response> fetchTreeList({bool force = false}) =>
      get(WanAndroidApiPaths.treeList, force);

  /// 体系列表
  static Future<Response> fetchTreeDetailList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.articleList}$page/json?cid=$id", force);

  /// 搜索热词
  static Future<Response> fetchHotKeywords({bool force = false}) =>
      get(WanAndroidApiPaths.hotKeywords, force);

  /// 搜索结果
  static Future<Response> fetchSearchResult(String query, String page) =>
      post("${WanAndroidApiPaths.searchForKeyword}$page/json",
          params: {'k': query});

  /// 积分排行榜
  static Future<Response> fetchPointRank(String page, {bool force = false}) =>
      get("${WanAndroidApiPaths.coinRankList}$page/json", force);

  /// 登录接口
  static Future<Response> login(String account, String password) {
    return post(WanAndroidApiPaths.login,
        params: {"username": account, "password": password});
  }

  /// 登出接口
  static Future<Response> logout({Map<String, String>? header}) {
    return get(WanAndroidApiPaths.logout, true, header: header);
  }

  /// 注册接口
  static Future<Response> register(
      String account, String password, String rePassword) {
    return post(WanAndroidApiPaths.register, params: {
      "username": account,
      "password": password,
      "repassword": rePassword
    });
  }

  /// 用户信息
  static Future<Response> fetchUserInfo({Map<String, String>? header}) {
    return get(WanAndroidApiPaths.userinfo, true, header: header);
  }

  /// 用户积分
  static Future<Response> fetchCoinList(String page,
          {Map<String, String>? header}) =>
      get("${WanAndroidApiPaths.coinList}$page/json", true, header: header);

  /// 用户收藏文章列表
  static Future<Response> fetchUserCollection(String page,
      {Map<String, String>? header}) {
    return get("${WanAndroidApiPaths.collectList}$page/json", true,
        header: header);
  }

  /// 收藏文章
  static Future<Response> collectArticle(String id,
      {Map<String, String>? header}) {
    return post("${WanAndroidApiPaths.collectArticle}$id/json", header: header);
  }

  /// 取消收藏文章
  static Future<Response> unCollectArticle(String id,
      {Map<String, String>? header}) {
    return post("${WanAndroidApiPaths.unCollectArticle}$id/json",
        header: header);
  }
}
