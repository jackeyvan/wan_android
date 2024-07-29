import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/modules/base/tab_page.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/widget/article_item_widget.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_page.dart';
import 'package:get/get.dart';

import 'project_controller.dart';

class ProjectTabPage extends BaseTabPage<ProjectTabController> {
  const ProjectTabPage({super.key});
}

class ProjectPage extends GetRefreshPage<ProjectController> {
  const ProjectPage({super.key, this.id});

  final int? id;

  /// 指定Controller的Tag
  @override
  String? get tag => id?.toString();

  @override
  void dependencies() {
    /// 为了给每个Page都绑定一个 Controller，需要设置tag
    /// 由于数据封装使用不了obs，只能使用GetBuilder，然后手动去update
    /// 同时因为自定义Tag的原因，直接使用GetView的controller会返回null
    Get.lazyPut(() => ProjectController(id: id), tag: id?.toString());
  }

  @override
  Widget buildPage(BuildContext context) =>
      buildObxRefreshListPage<ArticleEntity>(
        padding: const EdgeInsets.all(8),
        separatorBuilder: (item, index) => const SizedBox(height: 3),
        itemBuilder: (item, index) => ArticleItemWidget(item),
      );
}
