import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/wan_android_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/app/routes/routes.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';
import 'package:wan_android/core/page/refresh/refresh_page.dart';

class ScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScoreController());
  }
}

class ScoreController extends GetRefreshListController<ScoreEntity> {
  @override
  Future<List<ScoreEntity>> loadListData(int page, bool isRefresh) async {
    return WanAndroidRepository.fetchCoinList(page)
        .then((value) => value?.datas ?? []);
  }
}

class ScorePage extends GetRefreshPage<ScoreController> {
  const ScorePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return buildScaffoldPage(
        title: Obx(() => Text(Strings.score.tr.obs.value)),
        builder: buildObxRefreshListPage(itemBuilder: (item, index) {
          return Text(item.toString());
        }),
        actions: [
          TextButton(
              onPressed: () => Routes.toNamed(Routes.rank),
              child: Obx(() => Text(Strings.rank.tr.obs.value)))
        ]);
  }
}
