import 'package:flutter/material.dart';
import 'package:flutter_wan_android/core/net/api_error.dart';
import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:get/get.dart';

abstract class BaseTabController<T> extends BaseController<List<T>>
    with GetTickerProviderStateMixin {
  TabController? _tabController;

  String? title;

  @override
  void onReady() {
    super.onReady();
    _tabController = TabController(vsync: this, length: 0);

    loadTabs().then((tabs) {
      if (tabs != null && tabs.isNotEmpty) {
        _tabController = TabController(vsync: this, length: tabs.length);
        data = tabs;
        showSuccessPage();
      } else {
        showEmptyPage();
      }
    }).catchError((error, stack) {
      showErrorPage((error as ApiError).origin);
    });
  }

  TabController? get tabController => _tabController;

  List<T> get tabData => data ?? [];

  @override
  retryLoading() {
    showLoadingPage();
    onReady();
  }

  Future<List<T>?> loadTabs();

  List<Widget> buildPages();

  List<Widget> buildTabs();
}
