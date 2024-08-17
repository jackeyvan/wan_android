import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/wan_android_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/widget/article_item_widget.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';
import 'package:wan_android/core/page/refresh/refresh_page.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CollectionController());
}

class CollectionController extends GetRefreshListController<ArticleEntity> {
  @override
  Future<List<ArticleEntity>> loadListData(int page, bool isRefresh) {
    return WanAndroidRepository.fetchUserCollection(page)
        .then((v) => v?.datas ?? []);
  }
}

class CollectionPage extends GetRefreshPage<CollectionController> {
  const CollectionPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return buildScaffoldPage(
        title: Obx(() => Text(Strings.myCollection.tr.obs.value)),
        builder: buildObxRefreshListPage<ArticleEntity>(
            padding: const EdgeInsets.all(6),
            separatorBuilder: (item, index) => const SizedBox(height: 3),
            itemBuilder: (item, index) => ArticleItemWidget(item)));
  }
}
