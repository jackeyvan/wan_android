import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/globe_repository.dart';
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
    return GlobeRepository.fetchCoinRankList(page)
        .then((value) => value?.datas ?? []);
  }
}

class ScoreRankPage extends GetRefreshPage<ScoreRankController> {
  const ScoreRankPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return buildScaffoldPage(
        title: Obx(() => Text(Strings.rank.tr.obs.value)),
        builder: buildObxRefreshListPage<ScoreEntity>(
            separatorBuilder: (item, index) => const Divider(height: 0.1),
            itemBuilder: (item, index) {
              return ListTile(
                contentPadding: const EdgeInsets.all(4),
                title: Text(
                  item.username ?? "",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text('等级: ${item.level}'),
                trailing: Text(
                  '${item.coinCount}',
                  style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary),
                ),
              );
            },
            padding: const EdgeInsets.all(12)));
  }
}
