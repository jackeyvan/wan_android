import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/pgyer_repository.dart';
import 'package:flutter_wan_android/app/modules/entity/user_entity.dart';
import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:flutter_wan_android/core/utils/log_utils.dart';
import 'package:get/get.dart';

class RootController extends BaseController {
  final _currentBottomIndex = 0.obs;

  final pageController = PageController();

  set currentBottomIndex(index) {
    if (currentBottomIndex != index) {
      _currentBottomIndex.value = index;
    }
  }

  int get currentBottomIndex => _currentBottomIndex.value;

  void onPageChange(int index) {
    /// 更新索引和页面
    if (index != currentBottomIndex) {
      currentBottomIndex = index;
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    }
  }

  @override
  void onReady() {
    loadUserinfo();
    // loadAppInfo();
    super.onReady();
  }

  loadUserinfo() {
    // _provider.loadUserinfo().then((user) {});
  }

  void loadAppInfo() {
    PgyerRepository.appInfo().then((info) {
      // LogUtils.log(info);
    }).catchError((
      e,
    ) {
      LogUtils.log(e);
    });
  }

  @override
  void onClose() {
    User.streamController.close();
    super.onClose();
  }
}
