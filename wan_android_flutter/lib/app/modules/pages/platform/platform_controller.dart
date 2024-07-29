import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/base/tab_controller.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_controller.dart';
import 'package:get/get.dart';

import 'platform_page.dart';

class PlatformTabController extends BaseTabController<ArticleTabEntity> {
  @override
  List<Widget> buildPages() =>
      tabData.map((tab) => keepWidgetAlive(PlatformPage(id: tab.id))).toList();

  @override
  Future<List<ArticleTabEntity>?> loadTabs() =>
      WanAndroidRepository.platformTab();

  @override
  List<Widget> buildTabs() =>
      tabData.map((tab) => Tab(text: tab.name)).toList();

  @override
  String get title => Strings.platform.tr;
}

class PlatformController extends GetRefreshListController<ArticleEntity> {
  final int? id;

  PlatformController({this.id}) : super(initPage: 3);

  @override
  Future<List<ArticleEntity>> loadListData(int page, bool isRefresh) {
    return WanAndroidRepository.platformList(id ?? 0, page).then((e) {
      return (e?.datas ?? []).map((d) {
        d.tags = null;
        return d;
      }).toList();
    });
  }
}
