import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/modules/base/tab_page.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/structure_entity.dart';
import 'package:flutter_wan_android/app/modules/widget/article_item_widget.dart';
import 'package:flutter_wan_android/app/modules/widget/structure_wrap_widget.dart';
import 'package:flutter_wan_android/app/routes/routes.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_page.dart';
import 'package:get/get.dart';

import 'structure_controller.dart';

/// 体系首页带有Tab的页面，加载Tab并且填充页面
class StructureTabPage extends BaseTabPage<StructureTabController> {
  const StructureTabPage({super.key});
}

/// 体系首页页面，填充具体Tab对应的页面
class StructureListPage extends GetRefreshPage<StructureController> {
  final String tab;
  final bool fromTree;

  StructureListPage(this.tab, {super.key})
      : fromTree = tab == Get.find<StructureTabController>().tabData[0];

  @override
  String? get tag => tab;

  @override
  void dependencies() {
    Get.lazyPut(() => StructureController(fromTree), tag: tab);
  }

  @override
  Widget buildPage(BuildContext context) =>
      buildObxRefreshListPage<StructureEntity>(
        padding: const EdgeInsets.all(12),
        separatorBuilder: (item, index) => const SizedBox(
          height: 12,
        ),
        itemBuilder: (item, index) => TreeWrap(
          title: item.name,
          items: item.items,
          onItemTrap: (data, index) {
            /// 体系跳转
            if (fromTree) {
              var tabs = item.items ?? [];
              if (tabs.isNotEmpty) {
                item.index = index;
                Routes.toNamed(Routes.treeDetail, args: item);
              }
            } else {
              /// 导航跳转到WebView
              if (data.link != null) {
                Routes.toNamed(Routes.articleDetail,
                    args: ArticleEntity(title: data.name, link: data.link));
              }
            }
          },
        ),
      );
}

/// 体系详情页，一级Tab页面
class StructureDetailTabPage extends BaseTabPage<StructureDetailTabController> {
  const StructureDetailTabPage({super.key});
}

/// 体系详情页，具体Tab对应的页面
class StructureDetailListPage
    extends GetRefreshPage<StructureDetailListController> {
  final int? id;

  const StructureDetailListPage(this.id, {super.key});

  @override
  String? get tag => id?.toString();

  @override
  void dependencies() {
    Get.lazyPut(() => StructureDetailListController(id: id),
        tag: id?.toString());
  }

  @override
  Widget buildPage(BuildContext context) =>
      buildObxRefreshListPage<ArticleEntity>(
        padding: const EdgeInsets.all(8),
        separatorBuilder: (item, index) => const SizedBox(height: 3),
        itemBuilder: (item, index) => ArticleItemWidget(item),
      );
}
