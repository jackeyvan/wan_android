import 'package:wan_android/app/const/keys.dart';
import 'package:wan_android/core/init/storage.dart';

class WanAndroidApiPaths {
  /// 基础url
  static const baseUrl = "https://www.wanandroid.com/";

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
class WanAndroidRepository {}

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

  static String? readRememberAccount() {
    return Storage.read(Keys.rememberAccount);
  }

  static void writeRememberAccount(String value) {
    Storage.write(Keys.rememberAccount, value);
  }

  static String? readPasswordAccount() {
    return Storage.read(Keys.rememberPassword);
  }

  static void writePasswordAccount(String value) {
    Storage.write(Keys.rememberPassword, value);
  }
}
