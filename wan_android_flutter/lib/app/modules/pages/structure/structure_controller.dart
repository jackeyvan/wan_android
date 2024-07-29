import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/base/tab_controller.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/structure_entity.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_controller.dart';
import 'package:get/get.dart';

import 'structure_page.dart';

class StructureDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StructureDetailTabController());
  }
}

class StructureTabController extends BaseTabController<String> {
  @override
  List<Widget> buildPages() {
    return tabData.map((e) => keepWidgetAlive(StructureListPage(e))).toList();
  }

  @override
  Future<List<String>> loadTabs() =>
      Future.value([Strings.structure.tr, Strings.navigator.tr]);

  @override
  List<Widget> buildTabs() => tabData.map((e) => Tab(text: e)).toList();

  @override
  String get title => Strings.structure.tr;
}

class StructureController extends GetRefreshListController<StructureEntity> {
  final bool fromTree;

  StructureController(this.fromTree);

  @override
  Future<List<StructureEntity>> loadListData(int page, bool isRefresh) {
    if (fromTree) {
      return WanAndroidRepository.treeTabs();
    } else {
      return WanAndroidRepository.naviTabs();
    }
  }
}

class StructureDetailTabController extends BaseTabController<StructureEntity> {
  var index = 0;

  @override
  void showSuccessPage() {
    super.showSuccessPage();

    tabController?.animateTo(index);
  }

  @override
  Future<List<StructureEntity>> loadTabs() {
    var args = Get.arguments;
    if (args is StructureEntity) {
      title = args.name;
      index = args.index;
      return Future.value(args.items);
    }
    return Future.value([]);
  }

  @override
  List<Widget> buildPages() {
    return tabData
        .map((tab) => keepWidgetAlive(StructureDetailListPage(tab.id)))
        .toList();
  }

  @override
  List<Widget> buildTabs() => tabData.map((e) => Tab(text: e.name)).toList();
}

class StructureDetailListController
    extends GetRefreshListController<ArticleEntity> {
  final int? id;

  StructureDetailListController({required this.id});

  @override
  Future<List<ArticleEntity>> loadListData(int page, bool isRefresh) {
    return WanAndroidRepository.treeList(page, id ?? 0).then((e) {
      return (e?.datas ?? []).map((d) {
        d.chapterName = null;
        d.superChapterName = null;
        return d;
      }).toList();
    });
  }
}
