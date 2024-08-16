import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/wan_android_repository.dart';
import 'package:wan_android/core/page/base/base_controller.dart';
import 'package:wan_android/core/page/base/base_page.dart';

class CollectionBinding extends Bindings {
  @override
  void dependencies() => Get.lazyPut(() => CollectionController());
}

class CollectionController extends BaseController {
  final result = "暂无数据".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    WanAndroidRepository.fetchUserCollection(0).then((data) {
      print(data.toString());
      result.value = jsonEncode(data);
    });
  }
}

class CollectionPage extends BasePage<CollectionController> {
  @override
  Widget buildPage(BuildContext context) {
    return Center(
      child: Obx(() => Text(controller.result.value)),
    );
  }
}
