import 'package:http/http.dart' as http;
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

  /// 登录
  static const String login = "${baseUrl}user/login";

  /// 注册
  static const String register = "${baseUrl}user/register";

  /// 退出登录
  static const String logout = "${baseUrl}user/logout/json";

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
}

/// =====================================================================================================================
/// 接口封装，提供玩安卓所有远程接口
/// =====================================================================================================================
class Repository {
  /// 请求并且保存数据
  static Future<dynamic> get(String url, bool force) {
    /// 先从本地取
    final result = HiveBox.get(url);

    /// 本地没有拉取远程
    if (result == null) {
      return _getCore(url);
    } else {
      /// 本地有的话，看数据强制读取
      if (force) {
        return _getCore(url);
      } else {
        return Future.value(result);
      }
    }
  }

  static Future<dynamic> _getCore(String url) {
    return http.get(Uri.parse(url)).then((response) {
      print(response);
      if (response.statusCode == 200) {
        HiveBox.put(url, response.body);
        return response.body;
      }
      return null;
    }).catchError((e, s) {
      print(e.toString());
      return null;
    });
  }

  /// Banner数据
  static Future<dynamic> fetchBanner({bool force = false}) =>
      get(WanAndroidApiPaths.banner, force);

  /// 首页文章
  static Future<dynamic> fetchHomePageArticle(String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.articleList}$page/json", force);

  ///  置顶文章
  static Future<dynamic> fetchTopArticle({bool force = false}) =>
      get(WanAndroidApiPaths.topArticle, force);

  /// 公众号列表
  static Future<dynamic> fetchPlatformList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.wxArticleList}$id/$page/json", force);

  /// 公众号Tab
  static Future<dynamic> fetchPlatformTabs({bool force = false}) =>
      get(WanAndroidApiPaths.wxArticleTab, force);

  /// 项目Tab
  static Future<dynamic> fetchProjectTabs({bool force = false}) =>
      get(WanAndroidApiPaths.projectCategory, force);

  /// 项目列表
  static Future<dynamic> fetchProjectList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.projectList}$page/json?cid=$id", force);

  /// 导航系列数据
  static Future<dynamic> fetchNaviList({bool force = false}) =>
      get(WanAndroidApiPaths.naviList, force);

  /// 学习体系系列数据
  static Future<dynamic> fetchTreeList({bool force = false}) =>
      get(WanAndroidApiPaths.treeList, force);

  /// 体系列表
  static Future<dynamic> fetchTreeDetailList(String id, String page,
          {bool force = false}) =>
      get("${WanAndroidApiPaths.articleList}$page/json?cid=$id", force);

  /// 搜索热词
  static Future<dynamic> fetchHotKeywords({bool force = false}) =>
      get(WanAndroidApiPaths.hotKeywords, force);

// /// 搜索结果
//   static Future<dynamic> fetchSearchResult(String query,
//     int page) =>
//     post<>(
//         "${WanAndroidApiPaths.searchForKeyword}$page/json",
//         params: {'k': query}).then((e) => e?.datas ?? []);

// /// 登录接口
// static Future<User?> login(bool isLogin, String account, String password,
//     {String? rePassword}) {
//   if (isLogin) {
//     return _api.post<User>(WanAndroidApiPaths.login,
//         cacheMode: CacheMode.remoteOnly,
//         params: {"username": account, "password": password});
//   } else {
//     return _api.post<User>(WanAndroidApiPaths.register,
//         cacheMode: CacheMode.remoteOnly,
//         params: {
//           "username": account,
//           "password": password,
//           "repassword": rePassword
//         });
//   }
// }
//
// /// 退出登录
// static Future logout() {
//   return _api.get(WanAndroidApiPaths.logout);
// }
}
