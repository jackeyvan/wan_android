import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/modules/pages/article/article_detail_controller.dart';
import 'package:wan_android/app/modules/pages/article/article_detail_page.dart';
import 'package:wan_android/app/modules/pages/root/root_page.dart';
import 'package:wan_android/app/modules/pages/settings/collection_page.dart';
import 'package:wan_android/app/modules/pages/settings/language_page.dart';
import 'package:wan_android/app/modules/pages/settings/rank_page.dart';
import 'package:wan_android/app/modules/pages/settings/score_page.dart';
import 'package:wan_android/app/modules/pages/settings/theme_page.dart';
import 'package:wan_android/app/modules/pages/structure/structure_controller.dart';
import 'package:wan_android/app/modules/pages/structure/structure_page.dart';
import 'package:wan_android/app/modules/pages/user/login_controller.dart';
import 'package:wan_android/app/modules/pages/user/login_middleware.dart';
import 'package:wan_android/app/modules/pages/user/login_page.dart';
import 'package:wan_android/app/test/test_page.dart';

abstract class _Paths {
  static const root = '/home';

  // static const home = '/home';
  static const articleDetail = '/articleDetail';
  static const treeDetail = '/treeDetail';
  static const themeChose = '/themeChose';
  static const score = '/score';
  static const login = '/login';
  static const language = '/language';
  static const search = '/search';
  static const collection = '/collection';
  static const rank = '/rank';
  static const test = '/test';
}

/// 路由管理器
class Routes {
  static const root = _Paths.root;

  // static const home = _Paths.home;
  static const articleDetail = _Paths.articleDetail;
  static const treeDetail = _Paths.treeDetail;
  static const themeChose = _Paths.themeChose;
  static const score = _Paths.score;
  static const test = _Paths.test;
  static const collection = _Paths.collection;
  static const login = _Paths.login;
  static const language = _Paths.language;
  static const search = _Paths.search;
  static const rank = _Paths.rank;

  static final routes = [
    GetPage(name: root, page: () => const RootPage()),
    GetPage(name: test, page: () => const TestPage()),
    GetPage(
        name: articleDetail,
        page: () => const ArticleDetailPage(),
        binding: ArticleDetailBinding()),
    GetPage(
        name: treeDetail,
        page: () => const StructureDetailTabPage(),
        binding: StructureDetailBinding()),
    GetPage(
        name: themeChose,
        page: () => const ThemePage(),
        binding: ThemeBinding()),
    GetPage(
        name: login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(
        name: language,
        page: () => const LanguagePage(),
        binding: LanguageBinding()),
    GetPage(
        name: score,
        page: () => const ScorePage(),
        binding: ScoreBinding(),
        middlewares: [LoginMiddleware()]),
    GetPage(
        name: rank,
        page: () => const ScoreRankPage(),
        binding: ScoreRankBinding()),
    GetPage(
        name: collection,
        page: () => CollectionPage(),
        binding: CollectionBinding(),
        middlewares: [LoginMiddleware()]),
  ];

  /// 封装跳转页面方法
  static toNamed(String route, {dynamic args, int? id}) {
    Get.toNamed(route, arguments: args, id: id);
  }

  static offNamed(String route) {
    Get.offNamed(route);
  }

  /// 页面回退
  static back<T>({T? result}) {
    Get.back(result: result);
  }

  static openDrawer() {
    final context = Get.context;
    if (context != null) {
      Scaffold.of(context).openDrawer();
    }
  }
}
