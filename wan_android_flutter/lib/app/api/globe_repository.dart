import 'package:get/get.dart';
import 'package:wan_android/app/api/globe_api.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:wan_android/app/modules/entity/banner_entity.dart';
import 'package:wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/app/modules/entity/structure_entity.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/entity/user_info_entity.dart';
import 'package:wan_android/core/net/cache/cache.dart';

class GlobeApiPaths {
  /// 基础url
  static const baseUrl =
      "https://wan-android-backend-ddqc4sa-jackeyvan.globeapp.dev/";

  /// 文章列表
  static const String articleList = "api/v1/article/list";

  /// 置顶文章
  static const String topArticle = "api/v1/article/top";

  /// 获取banner
  static const String banner = "api/v1/banner";

  /// 登录
  static const String login = "api/v1/user/login";

  /// 注册
  static const String register = "api/v1/user/register";

  /// 退出登录
  static const String logout = "api/v1/user/logout/json";

  /// 项目分类
  static const String projectTabs = "api/v1/project/tabs";

  /// 项目列表
  static const String projectList = "api/v1/project/list";

  /// 搜索
  static const String searchForKeyword = "api/v1/article/query/";

  /// 获取搜索热词
  static const String hotKeywords = "api/v1/hotkey";

  /// 点击收藏文章
  static const String collectArticle = "api/v1/lg/collect/";

  /// 取消收藏文章
  static const String unCollectArticle = "api/v1/lg/uncollect_originId/";

  /// 获取收藏文章列表
  static const String collectList = "api/v1/lg/collect/list/";

  /// 公众号
  static const String wxArticleTab = "api/v1/platform/tabs";

  /// 某个公众号的文章列表
  static const String wxArticleList = "api/v1/platform/list";

  /// 学习体系
  static const String treeList = "api/v1/tree/list";

  /// 体系详情列表
  static const String treeDetailList = "api/v1/tree/detail/list";

  /// 导航  navi/json
  static const String naviList = "api/v1/navi/list";

  /// 用户信息
  static const String userinfo = "api/v1/user/lg/userinfo/json";

  /// 个人积分列表
  static const String coinList = "api/v1/lg/coin/list/";

  /// 积分排行榜
  static const String coinRankList = "api/v1/coin/rank/";
}

/// =====================================================================================================================
/// 接口封装，提供玩安卓所有远程接口
/// =====================================================================================================================
class GlobeRepository {
  static final _api = Get.find<GlobeApi>();

  /// Banner数据
  static Future<List<BannerEntity>?> fetchBanner() =>
      _api.get<List<BannerEntity>>(GlobeApiPaths.banner);

  /// 首页文章
  static Future<ArticleListEntity?> fetchHotArticle(int page) =>
      _api.get<ArticleListEntity>("${GlobeApiPaths.articleList}/$page");

  ///  置顶文章
  static Future<List<ArticleEntity>?> fetchTopArticle() =>
      _api.get<List<ArticleEntity>>(GlobeApiPaths.topArticle);

  /// 公众号Tab
  static Future<List<ArticleTabEntity>?> fetchPlatformTabs() =>
      _api.get<List<ArticleTabEntity>>(GlobeApiPaths.wxArticleTab);

  /// 公众号列表
  static Future<ArticleListEntity?> fetchPlatformList(int id, int page) =>
      _api.get<ArticleListEntity>("${GlobeApiPaths.wxArticleList}/$id/$page");

  /// 项目Tab
  static Future<List<ArticleTabEntity>?> fetchProjectTabs() =>
      _api.get<List<ArticleTabEntity>>(GlobeApiPaths.projectTabs);

  /// 项目列表
  static Future<ArticleListEntity?> fetchProjectList(int id, int page) =>
      _api.get<ArticleListEntity>("${GlobeApiPaths.projectList}/$id/$page");

  /// 导航系列数据
  static Future<List<StructureEntity>> fetchNaviList() => _api
      .get<List<NavigateEntity>>(GlobeApiPaths.naviList)
      .then((entities) => (entities ?? [])
          .map((e) => StructureEntity.transFromNavi(e))
          .toList());

  /// 学习体系系列数据
  static Future<List<StructureEntity>> fetchTreeList() => _api
      .get<List<ArticleTabEntity>>(GlobeApiPaths.treeList)
      .then((entities) => (entities ?? [])
          .map((e) => StructureEntity.transFromTree(e))
          .toList());

  /// 体系列表
  static Future<ArticleListEntity?> fetchTreeDetailList(int page, int id) =>
      _api.get<ArticleListEntity>("${GlobeApiPaths.treeDetailList}/$id/$page");

  /// 积分列表
  static Future<ScoreListEntity?> fetchCoinList(int page) =>
      _api.get<ScoreListEntity>("${GlobeApiPaths.coinList}$page/json",
          cacheMode: CacheMode.remoteOnly);

  /// 积分排行榜
  static Future<ScoreListEntity?> fetchCoinRankList(int page) =>
      _api.get<ScoreListEntity>("${GlobeApiPaths.coinRankList}$page/json");

  /// 搜索热词
  static Future<List<HotKeyEntity>?> fetchHotKeywords() async {
    /// 本地做一下缓存加载
    const path = GlobeApiPaths.hotKeywords;

    final result = Cache.readCache(Cache.cacheKey(path));
    if (result != null) {
      final data = _api.convert<List<HotKeyEntity>>(result);
      if (data != null) {
        return data;
      }
    }
    return _api.get<List<HotKeyEntity>>(path);
  }

  /// 搜索结果
  static Future<List<ArticleEntity>> fetchSearchResult(
          String query, int page) =>
      _api.post<ArticleListEntity>(
          "${GlobeApiPaths.searchForKeyword}$page/json",
          params: {'k': query}).then((e) => e?.datas ?? []);

  /// 登录接口
  static Future<User?> login(bool isLogin, String account, String password,
      {String? rePassword}) {
    if (isLogin) {
      return _api.post<User>(GlobeApiPaths.login,
          cacheMode: CacheMode.remoteOnly,
          params: {"username": account, "password": password});
    } else {
      return _api.post<User>(GlobeApiPaths.register,
          cacheMode: CacheMode.remoteOnly,
          params: {
            "username": account,
            "password": password,
            "repassword": rePassword
          });
    }
  }

  /// 退出登录
  static Future logout() {
    return _api.get(GlobeApiPaths.logout, cacheMode: CacheMode.remoteOnly);
  }

  /// 用户信息
  static Future<UserInfoEntity?> fetchUserInfo() {
    return _api.get<UserInfoEntity>(GlobeApiPaths.userinfo,
        cacheMode: CacheMode.remoteOnly);
  }

  /// 用户收藏文章列表
  static Future<ArticleListEntity?> fetchUserCollection(int page) {
    return _api.get<ArticleListEntity>("${GlobeApiPaths.collectList}$page/json",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 收藏文章
  static Future<dynamic> postCollectArticle(String id) {
    return _api.post("${GlobeApiPaths.collectArticle}$id/json",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 取消收藏文章
  static Future<dynamic> cancelCollectArticle(String id) {
    return _api.post("${GlobeApiPaths.unCollectArticle}$id/json",
        cacheMode: CacheMode.remoteOnly);
  }
}
