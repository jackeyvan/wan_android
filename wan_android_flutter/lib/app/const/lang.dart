import 'dart:ui';

import 'package:flutter_wan_android/app/const/keys.dart';
import 'package:flutter_wan_android/core/init/storage.dart';
import 'package:get/get.dart';

class Languages extends Translations {
  static const fallbackLocale = Locale('zh', 'CN');

  static Locale? get locale {
    final key = Storage.read(Keys.languageKey);

    if (key != null) {
      return langMappings[key];
    }
    return Get.deviceLocale;
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCN,
        'en_US': enUS,
      };
}

final langMappings = {
  '跟随系统': PlatformDispatcher.instance.locale,
  '中文': const Locale("zh", "CN"),
  'English': const Locale("en", "US"),
};

const zhCN = {
  'label': '玩安卓',
  'home': '首页',
  'project': '项目',
  'platform': '公众号',
  'structure': '体系',
  'languageSetting': '语言设置',
  'language': '语言',
  'themeSetting': '主题设置',
  'theme': '主题',
  'clickToLogin': '点我登录',
  'logout': '登出',
  'login': '登录',
  'loginSuccess': '登录成功',
  'register': '注册',
  'twicePasswordDiffer': '两次密码不一致',
  'registerSuccess': '注册成功',
  'search': '搜索',
  'putTop': '置顶',
  'clearSuccess': '清除成功',
  'clear': '清除',
  'navigator': '导航',
  'change': '换一换',
  'hotSearch': '热门搜索',
  'historySearch': '历史搜索',
  'logoutConfirm': '请确认退出登录',
  'logoutSuccess': '退出成功',
  'logoutFailure': '退出失败，请重试',
  'account': '账号',
  'donHaveAccount': '还没有账号？',
  'haveAccount': '已经有账号，',
  'accountOrPasswordIsNull': '账号或密码为空',
  'password': '密码',
  'rePassword': '重复密码',
};

const enUS = {
  'label': 'WanAndroid',
  'home': 'Home',
  'project': 'Project',
  'platform': 'Platform',
  'structure': 'Structure',
  'languageSetting': 'Language setting',
  'language': 'Language',
  'themeSetting': 'Theme setting',
  'theme': 'Theme',
  'clickToLogin': 'Click to login',
  'logout': 'Logout',
  'login': 'Login',
  'loginSuccess': 'Login success',
  'register': 'Register',
  'twicePasswordDiffer': 'The password is different',
  'registerSuccess': 'Register success',
  'search': 'Search',
  'putTop': 'Top',
  'clearSuccess': 'Clear success',
  'clear': 'Clear',
  'navigator': 'Navigator',
  'change': 'Change',
  'hotSearch': 'Hot search',
  'historySearch': 'History search',
  'logoutConfirm': 'Please confirm logout',
  'logoutSuccess': 'Logout success',
  'logoutFailure': 'Logout failure, please retry',
  'account': 'Account',
  'donHaveAccount': 'Don\'t have account？',
  'haveAccount': 'Already have account，',
  'accountOrPasswordIsNull': 'Account or password is empty',
  'password': 'Password',
  'rePassword': 'Password again',
};
