import 'package:flutter/material.dart';
import 'package:flutter_wan_android/core/init/storage.dart';
import 'package:get/get.dart';

class AppTheme {
  static const _themeKey = "themeKey";
  static const _themeModeKey = "themeMode";

  static final light = generateTheme(brightness: Brightness.light);

  static final dark = generateTheme(brightness: Brightness.dark);

  /// 可以根据不同的颜色，定制不同的主题
  static ThemeData generateTheme({
    required Brightness brightness,
    Color? colorSchemeSeed,
  }) {
    return ThemeData(
      brightness: brightness,
      useMaterial3: true,
      colorSchemeSeed: colorSchemeSeed,
    );
  }

  static String? readTheme() {
    return Storage.read(_themeKey);
  }

  static ThemeMode readThemeMode() {
    final mode = Storage.read(_themeModeKey);
    return ThemeMode.values.firstWhere((element) => element.name == mode,
        orElse: () => ThemeMode.values.first);
  }

  /// 根据Model数据来切换主题
  static changeThemeFromModel(ThemeModel model) {
    final mode = model.mode;
    final color = model.color;

    /// 切换模式
    if (mode != null) {
      changeThemeMode(mode);
      Storage.write(_themeModeKey, mode.name);
    }

    /// 切换主题
    if (color != null) {
      final themeData = generateTheme(
        brightness: Get.theme.brightness,
        colorSchemeSeed: color,
      );
      changeTheme(theme: themeData);
      Storage.write(_themeKey, model.name);
    }
  }

  static changeTheme({ThemeData? theme}) {
    if (theme != null) {
      /// GetX的Bug，黑夜模式下，用暴露的方法改不了，调用底层方法啊
      if (isDarkMode()) {
        Get.rootController.darkTheme = theme;
      }

      Get.changeTheme(theme);
    } else {
      /// 从缓存中读取数据更新主题
      /// 切换模式
      changeThemeMode(readThemeMode());

      /// 切换主题
      final themeName = readTheme();
      if (themeName != null) {
        final model = themes.firstWhere((element) => element.name == themeName);
        if (model.color != null) {
          final themeData = generateTheme(
            brightness: isDarkMode() ? Brightness.dark : Brightness.light,
            colorSchemeSeed: model.color,
          );
          changeTheme(theme: themeData);
        }
      }
    }
  }

  static changeThemeMode(ThemeMode theme) {
    Get.changeThemeMode(theme);
  }

  /// 如果还有页面还没初始化，是拿不到当前的模式，需要从缓存中取
  static bool isDarkMode() {
    if (Get.context == null) {
      return readThemeMode() == ThemeMode.dark;
    } else {
      return Get.isDarkMode;
    }
  }

  /// 获取当前主题
  static ThemeData getTheme() {
    return Get.theme;
  }

  ///  获取主题颜色模板
  static ColorScheme getColorScheme() {
    return getTheme().colorScheme;
  }

  static Color primary() {
    return getColorScheme().primary;
  }

  static Color onPrimary() {
    return getColorScheme().onPrimary;
  }

  static Color primaryContainer() {
    return getColorScheme().primaryContainer;
  }

  static Color secondary() {
    return getColorScheme().secondary;
  }

  static Color onSecondary() {
    return getColorScheme().onSecondary;
  }

  static final themes = [
    ThemeModel(
      name: 'System',
      mode: ThemeMode.system,
      icon: GetPlatform.isMobile ? Icons.phone_android : Icons.computer,
    ),
    ThemeModel(
      name: 'Light',
      mode: ThemeMode.light,
      icon: Icons.light_mode,
    ),
    ThemeModel(
      name: 'Dark',
      mode: ThemeMode.dark,
      icon: Icons.dark_mode,
    ),
    ThemeModel(
      name: 'Blue',
      color: Colors.blue,
    ),
    ThemeModel(
      name: 'Red',
      color: Colors.red,
    ),
    ThemeModel(
      name: 'Pink',
      color: Colors.pink,
    ),
    ThemeModel(
      name: 'Purple',
      color: Colors.purple,
    ),
    ThemeModel(
      name: 'DeepPurple',
      color: Colors.deepPurple,
    ),
    ThemeModel(
      name: 'Indigo',
      color: Colors.indigo,
    ),
    ThemeModel(
      name: 'LightBlue',
      color: Colors.lightBlue,
    ),
    ThemeModel(
      name: 'Cyan',
      color: Colors.cyan,
    ),
    ThemeModel(
      name: 'Teal',
      color: Colors.teal,
    ),
    ThemeModel(
      name: 'LightGreen',
      color: Colors.lightGreen,
    ),
    ThemeModel(
      name: 'Lime',
      color: Colors.lime,
    ),
    ThemeModel(
      name: 'Yellow',
      color: Colors.yellow,
    ),
    ThemeModel(
      name: 'Amber',
      color: Colors.amber,
    ),
    ThemeModel(
      name: 'Orange',
      color: Colors.orange,
    ),
    ThemeModel(
      name: 'DeepOrange',
      color: Colors.deepOrange,
    ),
    ThemeModel(
      name: 'Brown',
      color: Colors.brown,
    ),
    ThemeModel(
      name: 'Grey',
      color: Colors.grey,
    ),
    ThemeModel(
      name: 'BlueGrey',
      color: Colors.blueGrey,
    ),
  ];
}

class ThemeModel {
  String name;
  Color? color;
  ThemeMode? mode;
  IconData? icon;

  ThemeModel({
    required this.name,
    this.color,
    this.mode,
    this.icon,
  });
}

// static ThemeData _yellow() {
//   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//     statusBarColor: Colors.yellow.shade700, // status bar color
//     statusBarBrightness: Brightness.dark, //status bar brigtness
//     statusBarIconBrightness: Brightness.dark, //status barIcon Brightness
//   ));
