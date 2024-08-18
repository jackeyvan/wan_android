import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/globe/globe_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/base/tab_controller.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';

import 'project_page.dart';

class ProjectTabController extends BaseTabController<ArticleTabEntity> {
  @override
  List<Widget> buildPages() =>
      tabData.map((tab) => keepWidgetAlive(ProjectPage(id: tab.id))).toList();

  @override
  Future<List<ArticleTabEntity>?> loadTabs() =>
      GlobeRepository.fetchProjectTabs();

  @override
  List<Widget> buildTabs() =>
      tabData.map((tab) => Tab(text: tab.name)).toList();

  @override
  String get title => Strings.project.tr;
}

class ProjectController extends GetRefreshListController<ArticleEntity> {
  final int? id;

  ProjectController({this.id}) : super(initPage: 1);

  @override
  Future<List<ArticleEntity>> loadListData(int page, bool isRefresh) =>
      GlobeRepository.fetchProjectList(id ?? 0, page).then((value) =>
          value?.datas?.map((e) {
            /// 重置一下文章数据
            e.tags = null;
            e.superChapterName = null;
            e.chapterName = null;
            return e;
          }).toList() ??
          []);
}
