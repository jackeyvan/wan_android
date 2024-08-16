import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/wan_android_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';
import 'package:wan_android/core/page/refresh/refresh_page.dart';

class ScoreRankBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScoreRankController());
  }
}

class ScoreRankController extends GetRefreshListController<ScoreEntity> {
  ScoreRankController() : super(initPage: 1);

  @override
  Future<List<ScoreEntity>> loadListData(int page, bool isRefresh) {
    return WanAndroidRepository.fetchCoinRankList(page)
        .then((value) => value?.datas ?? []);
  }
}

class ScoreRankPage extends GetRefreshPage<ScoreRankController> {
  const ScoreRankPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return buildScaffoldPage(
        title: Obx(() => Text(Strings.rank.tr.obs.value)),
        builder: buildObxRefreshListPage(itemBuilder: (item, index) {
          return Text(item.toString());
        }));
  }
}
