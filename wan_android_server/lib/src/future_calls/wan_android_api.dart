import 'package:http/http.dart';

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

  /// 广场页列表
  static const String plazaArticleList = "${baseUrl}user_article/list/";

  /// 点击收藏
  static const String collectArticle = "${baseUrl}lg/collect/";

  /// 取消收藏
  static const String unCollectArticle = "${baseUrl}lg/uncollect_originId/";

  /// 获取搜索热词
  static const String hotKeywords = "${baseUrl}hotkey/json";

  /// 获取收藏文章列表
  static const String collectList = "${baseUrl}lg/collect/list/";

  /// 收藏网站列表
  static const String collectWebaddressList =
      "${baseUrl}lg/collect/usertools/json";

  /// 我的分享
  static const String sharedList = "${baseUrl}user/lg/private_articles/";

  /// 分享文章 post
  static const String shareArticle = "${baseUrl}lg/user_article/add/json";

  /// todoList
  static const String todoList = "${baseUrl}lg/todo/v2/list/";

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
}

class WanAndroidApi {
  Future<Response> fetchBanner() => get(Uri.parse(WanAndroidApiPaths.banner));
}
