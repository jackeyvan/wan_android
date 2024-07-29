import 'package:flutter/material.dart';
import 'package:flutter_wan_android/core/page/base/base_page.dart';

import 'tab_controller.dart';

class BaseTabPage<C extends BaseTabController> extends BasePage<C> {
  const BaseTabPage({super.key});

  @override
  Widget buildPage(BuildContext context) => buildObx(
      builder: () => NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: _buildTitle(),
                  centerTitle: false,
                  bottom: buildTabBar(),
                  snap: true,
                  pinned: true,
                  floating: true,
                ),
              ];
            },
            body: TabBarView(
                controller: controller.tabController,
                children: controller.buildPages()),
          ));

  Widget? _buildTitle() {
    return Text(controller.title ?? "",
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
  }

  PreferredSizeWidget? buildTabBar() {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      tabs: controller.buildTabs(),
      controller: controller.tabController,
    );
  }
}
