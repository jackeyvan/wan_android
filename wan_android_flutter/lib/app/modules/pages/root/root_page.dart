import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/pgyer/pgyer_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/pages/home/home_page.dart';
import 'package:wan_android/app/modules/pages/platform/platform_page.dart';
import 'package:wan_android/app/modules/pages/project/project_page.dart';
import 'package:wan_android/app/modules/pages/root/drawer_page.dart';
import 'package:wan_android/app/modules/pages/structure/structure_page.dart';
import 'package:wan_android/app/routes/routes.dart';
import 'package:wan_android/core/page/base/base_controller.dart';
import 'package:wan_android/core/page/base/base_page.dart';
import 'package:wan_android/core/utils/log_utils.dart';

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
    // loadAppInfo();
    super.onReady();
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

/// 因为Web端有跨域和Cookie问题，Web端阉割掉用户相关的功能
class RootPage extends BasePage<RootController> {
  const RootPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
        drawer: !GetPlatform.isWeb ? const Drawer(child: DrawerPage()) : null,
        bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
        floatingActionButton: GetPlatform.isWeb
            ? FloatingActionButton(
                onPressed: () => Routes.toNamed(Routes.themeChose),
                child: const Icon(Icons.color_lens_outlined),
              )
            : null,
        body: buildBody());
  }

  /// 生成底部Bar
  BottomNavigationBar _buildBottomNavigationBar() {
    final items = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: const Icon(Icons.home), label: Strings.home.tr),
      BottomNavigationBarItem(
          icon: const Icon(Icons.propane_outlined), label: Strings.project.tr),
      BottomNavigationBarItem(
          icon: const Icon(Icons.call_split), label: Strings.structure.tr),
      BottomNavigationBarItem(
          icon: const Icon(Icons.adjust_outlined), label: Strings.platform.tr),
    ];

    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: items,
        onTap: (index) => controller.onPageChange(index),
        currentIndex: controller.currentBottomIndex);
  }

  buildBody() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        keepWidgetAlive(const HomePage()),
        keepWidgetAlive(const ProjectTabPage()),
        keepWidgetAlive(const StructureTabPage()),
        keepWidgetAlive(const PlatformTabPage()),
      ],
    );
  }
}
