import 'package:flutter/material.dart';
import 'package:flutter_wan_android/core/page/widgets/keep_alive_wrapper.dart';
import 'package:get/get.dart';

/// 封装基类Controller，绑定数据T，可以根据业务情况，展示不同的页面
class BaseController<T> extends GetxController with StateMixin<T> {
  /// 展示成功页面
  /// 配合controller.obx使用
  void showSuccessPage() {
    change(value, status: RxStatus.success());
  }

  /// 展示空页面
  void showEmptyPage() {
    change(null, status: RxStatus.empty());
  }

  /// 展示加载页面
  void showLoadingPage() {
    change(null, status: RxStatus.loading());
  }

  /// 展示异常页面
  void showErrorPage(String? msg) {
    change(null, status: RxStatus.error(msg));
  }

  /// 如果页面不需要填充loading页面，也可以使用Dialog填充
  void showLoadingDialog() {
    // LoadingDialog.show();
  }

  /// 隐藏加载弹窗
  void dismissLoadingDialog() {
    // LoadingDialog.dismiss();
  }

  /// 如果页面发生了异常，需要重新加载，子类重新本方法即可
  void retryLoading() {}

  /// 设置数据
  set data(T? data) => value = data;

  /// 获取数据
  T? get data => value;

  /// 组件保活
  Widget keepWidgetAlive(Widget child) => KeepAliveWrapper(child: child);
}
