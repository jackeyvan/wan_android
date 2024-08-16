import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';
import 'package:wan_android/core/page/refresh/refresh_page.dart';

class ScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScoreController());
  }
}

class ScoreController extends GetRefreshListController {
  @override
  Future<List> loadListData(int page, bool isRefresh) {
    throw UnimplementedError();
  }
}

class ScorePage extends GetRefreshPage {
  const ScorePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    // TODO: implement buildPage
    throw UnimplementedError();
  }
}
