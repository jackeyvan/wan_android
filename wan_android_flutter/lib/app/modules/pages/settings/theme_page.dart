import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_controller.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_page.dart';
import 'package:flutter_wan_android/app/modules/widget/theme_item_widget.dart';
import 'package:flutter_wan_android/core/init/themes.dart';
import 'package:get/get.dart';

class ThemePage extends ScaffoldPage<ThemeController> {
  const ThemePage({super.key});

  @override
  Widget buildBodyPage() {
    return GetBuilder(
        init: controller,
        builder: (c) {
          return ListView(
            padding: const EdgeInsets.all(0),
            children: buildItems(),
          );
        });
  }

  Widget buildItem(ThemeModel model) {
    return ListItem(
      title: model.name,
      leading: model.icon == null
          ? Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: model.color,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
            )
          : Icon(model.icon),
      divider: false,
      selectBgColor: controller.selectColor,
      selected: controller.isSelected(model),
      onTap: () => controller.onItemClick(model),
    );
  }

  List<Widget> buildItems() {
    final items = <Widget>[];

    /// 模式
    items.addAll(AppTheme.themes
        .where((e) => e.mode != null)
        .map((e) => buildItem(e))
        .toList());

    /// 分割
    items.add(const Divider(height: 8));

    /// 颜色
    items.addAll(AppTheme.themes
        .where((e) => e.color != null)
        .map((e) => buildItem(e))
        .toList());

    return items;
  }
}

class ThemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
  }
}

class ThemeController extends ScaffoldController {
  final name = (AppTheme.readTheme() ?? AppTheme.themes[0].name).obs;

  final themeMode = AppTheme.readThemeMode().obs;

  bool isDarkMode = AppTheme.isDarkMode();

  @override
  void onReady() {
    title = Strings.themeSetting.tr;
    super.onReady();
  }

  void onItemClick(ThemeModel model) {
    if (model.mode != null) {
      themeMode.value = model.mode!;
      isDarkMode = model.mode! == ThemeMode.dark;
    } else {
      name.value = model.name;
    }

    AppTheme.changeThemeFromModel(model);

    update();
  }

  bool isSelected(ThemeModel model) {
    if (model.mode != null) {
      return themeMode.value == model.mode;
    }

    return name.value == model.name;
  }

  Color get selectColor {
    return isDarkMode ? Colors.white12 : Colors.black12;
  }
}
