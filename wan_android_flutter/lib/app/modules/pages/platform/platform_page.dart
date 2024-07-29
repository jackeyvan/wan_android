import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/modules/base/tab_page.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/widget/article_item_widget.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_page.dart';
import 'package:get/get.dart';

import 'platform_controller.dart';

/// 公众号带有Tab页面
class PlatformTabPage extends BaseTabPage<PlatformTabController> {
  const PlatformTabPage({super.key});
}

/// 公众号列表页面
class PlatformPage extends GetRefreshPage<PlatformController> {
  const PlatformPage({super.key, this.id});

  final int? id;

  @override
  String? get tag => id?.toString();

  @override
  void dependencies() {
    Get.lazyPut(() => PlatformController(id: id), tag: id?.toString());
  }

  @override
  Widget buildPage(BuildContext context) =>
      buildObxRefreshListPage<ArticleEntity>(
        padding: const EdgeInsets.all(8),
        separatorBuilder: (item, index) => const SizedBox(height: 3),
        itemBuilder: (item, index) => ArticleItemWidget(item),
      );
}
