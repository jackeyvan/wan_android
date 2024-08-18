import 'dart:convert';

import 'package:get/get.dart';
import 'package:wan_android/app/api/globe/globe_api.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:wan_android/app/modules/entity/banner_entity.dart';
import 'package:wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/app/modules/entity/structure_entity.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/entity/user_info_entity.dart';
import 'package:wan_android/core/net/cache/cache.dart';

import 'globe_paths.dart';

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
      _api.get<ScoreListEntity>("${GlobeApiPaths.coinList}/$page",
          cacheMode: CacheMode.remoteOnly);

  /// 积分排行榜
  static Future<ScoreListEntity?> fetchCoinRankList(int page) =>
      _api.get<ScoreListEntity>("${GlobeApiPaths.coinRankList}/$page");

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
      _api
          .post<ArticleListEntity>("${GlobeApiPaths.searchForKeyword}/$page",
              body: jsonEncode({"query": query}))
          .then((e) => e?.datas ?? []);

  /// 登录接口
  static Future<User?> login(bool isLogin, String account, String password,
      {String? rePassword}) {
    if (isLogin) {
      return _api.post<User>(GlobeApiPaths.login,
          cacheMode: CacheMode.remoteOnly,
          body: jsonEncode({"username": account, "password": password}));
    } else {
      return _api.post<User>(GlobeApiPaths.register,
          cacheMode: CacheMode.remoteOnly,
          body: jsonEncode({
            "username": account,
            "password": password,
            "rePassword": rePassword
          }));
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
    return _api.get<ArticleListEntity>("${GlobeApiPaths.collectList}/$page",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 收藏文章
  static Future<dynamic> collectArticle(String id) {
    return _api.post("${GlobeApiPaths.collectArticle}/$id",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 取消收藏文章
  static Future<dynamic> unCollectArticle(String id) {
    return _api.post("${GlobeApiPaths.unCollectArticle}/$id",
        cacheMode: CacheMode.remoteOnly);
  }
}
