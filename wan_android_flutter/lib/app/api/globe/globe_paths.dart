class GlobeApiPaths {
  /// 基础url
  static const baseUrl = "https://wan-android-backend.globeapp.dev/";

  // static const baseUrl = "http://0.0.0.0:8080/";

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
  static const String logout = "api/v1/user/logout";

  /// 项目分类
  static const String projectTabs = "api/v1/project/tabs";

  /// 项目列表
  static const String projectList = "api/v1/project/list";

  /// 搜索
  static const String searchForKeyword = "api/v1/search";

  /// 获取搜索热词
  static const String hotKeywords = "api/v1/hotkey";

  /// 点击收藏文章
  static const String collectArticle = "api/v1/user/collect";

  /// 取消收藏文章
  static const String unCollectArticle = "api/v1/user/uncollect";

  /// 获取收藏文章列表
  static const String collectList = "api/v1/user/collect/list";

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
  static const String userinfo = "api/v1/user/info";

  /// 个人积分列表
  static const String coinList = "api/v1/user/points";

  /// 积分排行榜
  static const String coinRankList = "api/v1/point/rank";
}
