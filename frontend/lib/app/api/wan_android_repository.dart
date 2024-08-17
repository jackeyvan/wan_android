import 'package:get/get.dart';
import 'package:wan_android/app/api/wan_android_api.dart';
import 'package:wan_android/app/const/keys.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:wan_android/app/modules/entity/banner_entity.dart';
import 'package:wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/app/modules/entity/structure_entity.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/entity/user_info_entity.dart';
import 'package:wan_android/core/init/storage.dart';
import 'package:wan_android/core/net/cache/cache.dart';

class WanAndroidApiPaths {
  /// 基础url
  static const baseUrl = "https://www.wanandroid.com/";

  /// 文章列表
  static const String articleList = "article/list/";

  /// 置顶文章
  static const String topArticle = "article/top/json";

  /// 获取banner
  static const String banner = "banner/json";

  /// 登录
  static const String login = "user/login";

  /// 注册
  static const String register = "user/register";

  /// 退出登录
  static const String logout = "user/logout/json";

  /// 项目分类
  static const String projectCategory = "project/tree/json";

  /// 项目列表
  static const String projectList = "project/list/";

  /// 搜索
  static const String searchForKeyword = "article/query/";

  /// 获取搜索热词
  static const String hotKeywords = "hotkey/json";

  /// 点击收藏文章
  static const String collectArticle = "lg/collect/";

  /// 取消收藏文章
  static const String unCollectArticle = "lg/uncollect_originId/";

  /// 获取收藏文章列表
  static const String collectList = "lg/collect/list/";

  /// 公众号
  static const String wxArticleTab = "wxarticle/chapters/json";

  /// 某个公众号的文章列表  wxarticle/list/408/1/json
  static const String wxArticleList = "wxarticle/list/";

  /// 学习体系
  static const String treeList = "tree/json";

  /// 导航  navi/json
  static const String naviList = "navi/json";

  /// 用户信息
  static const String userinfo = "user/lg/userinfo/json";

  /// 个人积分列表
  static const String coinList = "lg/coin/list/";

  /// 积分排行榜
  static const String coinRankList = "coin/rank/";
}

/// =====================================================================================================================
/// 接口封装，提供玩安卓所有远程接口
/// =====================================================================================================================
class WanAndroidRepository {
  static final _api = Get.find<WanAndroidApi>();

  /// Banner数据
  static Future<List<BannerEntity>?> banner() =>
      _api.get<List<BannerEntity>>(WanAndroidApiPaths.banner);

  /// 首页文章
  static Future<ArticleListEntity?> homePageArticle(int page) => _api
      .get<ArticleListEntity>("${WanAndroidApiPaths.articleList}$page/json");

  ///  置顶文章
  static Future<List<ArticleEntity>?> topArticle() =>
      _api.get<List<ArticleEntity>>(WanAndroidApiPaths.topArticle);

  /// 公众号列表
  static Future<ArticleListEntity?> platformList(int id, int page) =>
      _api.get<ArticleListEntity>(
          "${WanAndroidApiPaths.wxArticleList}$id/$page/json");

  /// 公众号Tab
  static Future<List<ArticleTabEntity>?> platformTab() =>
      _api.get<List<ArticleTabEntity>>(WanAndroidApiPaths.wxArticleTab);

  /// 项目Tab
  static Future<List<ArticleTabEntity>?> projectTabs() =>
      _api.get<List<ArticleTabEntity>>(WanAndroidApiPaths.projectCategory);

  /// 项目列表
  static Future<ArticleListEntity?> projectList(int id, int page) =>
      _api.get<ArticleListEntity>("${WanAndroidApiPaths.projectList}$page/json",
          params: {"cid": id});

  /// 导航系列数据
  static Future<List<StructureEntity>> naviTabs() => _api
      .get<List<NavigateEntity>>(WanAndroidApiPaths.naviList)
      .then((entities) => (entities ?? [])
          .map((e) => StructureEntity.transFromNavi(e))
          .toList());

  /// 学习体系系列数据
  static Future<List<StructureEntity>> treeTabs() => _api
      .get<List<ArticleTabEntity>>(WanAndroidApiPaths.treeList)
      .then((entities) => (entities ?? [])
          .map((e) => StructureEntity.transFromTree(e))
          .toList());

  /// 体系列表
  static Future<ArticleListEntity?> treeList(int page, int id) =>
      _api.get<ArticleListEntity>("${WanAndroidApiPaths.articleList}$page/json",
          params: {"cid": id});

  /// 积分列表
  static Future<ScoreListEntity?> fetchCoinList(int page) =>
      _api.get<ScoreListEntity>("${WanAndroidApiPaths.coinList}$page/json",
          cacheMode: CacheMode.remoteOnly);

  /// 积分排行榜
  static Future<ScoreListEntity?> fetchCoinRankList(int page) =>
      _api.get<ScoreListEntity>("${WanAndroidApiPaths.coinRankList}$page/json");

  /// 搜索热词
  static Future<List<HotKeyEntity>?> hotKeywords() async {
    /// 本地做一下缓存加载
    const path = WanAndroidApiPaths.hotKeywords;

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
          "${WanAndroidApiPaths.searchForKeyword}$page/json",
          params: {'k': query}).then((e) => e?.datas ?? []);

  /// 登录接口
  static Future<User?> login(bool isLogin, String account, String password,
      {String? rePassword}) {
    if (isLogin) {
      return _api.post<User>(WanAndroidApiPaths.login,
          cacheMode: CacheMode.remoteOnly,
          params: {"username": account, "password": password});
    } else {
      return _api.post<User>(WanAndroidApiPaths.register,
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
    return _api.get(WanAndroidApiPaths.logout, cacheMode: CacheMode.remoteOnly);
  }

  /// 用户信息
  static Future<UserInfoEntity?> fetchUserInfo() {
    return _api.get<UserInfoEntity>(WanAndroidApiPaths.userinfo,
        cacheMode: CacheMode.remoteOnly);
  }

  /// 用户收藏文章列表
  static Future<ArticleListEntity?> fetchUserCollection(int page) {
    return _api.get<ArticleListEntity>(
        "${WanAndroidApiPaths.collectList}$page/json",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 收藏文章
  static Future<dynamic> postCollectArticle(String id) {
    return _api.post("${WanAndroidApiPaths.collectArticle}$id/json",
        cacheMode: CacheMode.remoteOnly);
  }

  /// 取消收藏文章
  static Future<dynamic> cancelCollectArticle(String id) {
    return _api.post("${WanAndroidApiPaths.unCollectArticle}$id/json",
        cacheMode: CacheMode.remoteOnly);
  }
}

/// =====================================================================================================================
/// 本地存储封装，提供所有本地数据
/// =====================================================================================================================
class WanAndroidStorage {
  ///  搜索历史记录
  static List<String> readSearchHistory() {
    final history = Storage.read<List>(Keys.searchHistory);
    return (history ?? []).map((e) => e as String).toList();
  }

  /// 添加搜索历史记录
  static void writeSearchHistory(String value) {
    final history = readSearchHistory();
    if (history.contains(value)) {
      history.remove(value);
    }
    history.insert(0, value);
    Storage.write(Keys.searchHistory, history);
  }

  ///  清空历史记录
  static void clearSearchHistory() {
    Storage.remove(Keys.searchHistory);
  }

  ///  本地动态收藏文章和网址
  static void saveCollect(String key, String id) {
    Storage.write(key, id);
  }

  /// 获取本地收藏状态
  static String? readCollect(String key) {
    return Storage.read<String>(key);
  }

  /// 取消收藏
  static void removeCollect(String key) {
    Storage.remove(key);
  }
}
