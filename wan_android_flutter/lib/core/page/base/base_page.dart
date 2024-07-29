import 'package:flutter/material.dart';
import 'package:flutter_wan_android/core/page/status/default_empty_page.dart';
import 'package:flutter_wan_android/core/page/status/default_error_page.dart';
import 'package:flutter_wan_android/core/page/status/default_loading_page.dart';
import 'package:get/get.dart';

import 'base_controller.dart';

/// 基类View，实现自GetX，可以随时更换
abstract class BasePage<C extends BaseController> extends GetView<C> {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    dependencies();
    return Material(child: buildPage(context));
  }

  /// 使用obx来更新页面的State
  Widget buildObx(
      {required Widget Function() builder,
      Widget? onLoading,
      Widget? onEmpty,
      Widget Function(String? error)? onError}) {
    return controller.obx((data) => builder.call(),
        onError: onError ?? (error) => buildErrorPage(error),
        onEmpty: onEmpty ?? buildEmptyPage(),
        onLoading: onLoading ?? buildLoadingPage());
  }

  /// 未实现的方法，子类可以用这个方法绑定Controller
  /// 或者做一些初始化工作，但是注意：页面每次Build都会调用
  /// 如果子类在Route里实现Bindings，这里可以不使用
  void dependencies() {}

  /// 子类重写，需要填充的页面
  Widget buildPage(BuildContext context);

  /// 默认的加载页
  Widget buildLoadingPage() => const LoadingPage();

  /// 默认的空页面
  Widget buildEmptyPage() => const EmptyPage();

  /// 默认的错误展示页面
  Widget buildErrorPage(String? error) =>
      ErrorPage(msg: error, onRetry: controller.retryLoading);

  /// 组件保活
  Widget keepWidgetAlive(Widget child) => controller.keepWidgetAlive(child);
}
