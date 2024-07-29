import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/pages/home/home_page.dart';
import 'package:flutter_wan_android/app/modules/pages/platform/platform_page.dart';
import 'package:flutter_wan_android/app/modules/pages/project/project_page.dart';
import 'package:flutter_wan_android/app/modules/pages/root/drawer_page.dart';
import 'package:flutter_wan_android/app/modules/pages/structure/structure_page.dart';
import 'package:flutter_wan_android/core/page/base/base_page.dart';
import 'package:get/get.dart';

import 'root_controller.dart';

class RootPage extends BasePage<RootController> {
  const RootPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(child: DrawerPage()),
        bottomNavigationBar: Obx(() => _buildBottomNavigationBar()),
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
