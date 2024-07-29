import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_controller.dart';
import 'package:flutter_wan_android/core/page/base/base_page.dart';
import 'package:get/get.dart';

abstract class ScaffoldPage<C extends ScaffoldController> extends BasePage<C> {
  const ScaffoldPage({super.key});

  @override
  Widget buildPage(BuildContext context) => NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              actions: buildActions(),
              title: Obx(() => _buildTitle()),
              centerTitle: false,
              pinned: true,
            ),
          ];
        },
        body: buildBodyPage(),
      );

  Widget _buildTitle() {
    return Text(controller.title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500));
  }

  Widget buildBodyPage();

  List<Widget>? buildActions() => null;
}
