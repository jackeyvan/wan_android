import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/const/keys.dart';
import 'package:flutter_wan_android/app/const/lang.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_controller.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_page.dart';
import 'package:flutter_wan_android/core/init/storage.dart';
import 'package:flutter_wan_android/core/init/themes.dart';
import 'package:get/get.dart';

class LanguagePage extends ScaffoldPage<LanguageController> {
  const LanguagePage({super.key});

  @override
  Widget buildBodyPage() {
    controller.setTitle();
    return ListView(
      padding: const EdgeInsets.all(0),
      children: controller.languages.map((e) => buildItem(e)).toList(),
    );
  }

  Widget buildItem(String item) {
    return Obx(() => ListTile(
        selectedTileColor: controller.selectColor,
        selected: controller.isSelected(item),
        onTap: () => controller.onItemClick(item),
        title: Text(item)));
  }
}

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LanguageController());
  }
}

class LanguageController extends ScaffoldController {
  List<String> languages = [];
  final language = "".obs;

  @override
  void onInit() {
    languages = langMappings.keys.toList();

    language.value = Storage.read(Keys.languageKey) ?? languages[0];

    super.onInit();
  }

  void onItemClick(String item) {
    language.value = item;
    final locale = langMappings[item];
    if (locale != null) {
      Get.updateLocale(locale);
      Storage.write(Keys.languageKey, item);
    }
  }

  bool isSelected(String item) {
    return language.value == item;
  }

  Color get selectColor {
    return AppTheme.isDarkMode() ? Colors.white12 : Colors.black12;
  }

  void setTitle() {
    title = Strings.languageSetting.tr;
  }
}
