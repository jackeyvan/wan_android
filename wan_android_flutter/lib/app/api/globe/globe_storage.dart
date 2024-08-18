import 'package:wan_android/app/const/keys.dart';
import 'package:wan_android/core/init/storage.dart';

/// =====================================================================================================================
/// 本地存储封装，提供所有本地数据
/// =====================================================================================================================
class GlobeStorage {
  ///  搜索历史记录
  static List<String> readSearchHistory() {
    final history = Storage.read<List>(Keys.searchHistory);
    return (history ?? []).map((e) => e as String).toList();
  }

  /// 添加搜索历史记录
  static void writeSearchHistory(String value) {
    final history = readSearchHistory();
    if (history.contains(value)) {
      history.remove(value);
    }
    history.insert(0, value);
    Storage.write(Keys.searchHistory, history);
  }

  ///  清空历史记录
  static void clearSearchHistory() {
    Storage.remove(Keys.searchHistory);
  }

  ///  本地动态收藏文章和网址
  static void saveCollect(String key, String id) {
    Storage.write(key, id);
  }

  /// 获取本地收藏状态
  static String? readCollect(String key) {
    return Storage.read<String>(key);
  }

  /// 取消收藏
  static void removeCollect(String key) {
    Storage.remove(key);
  }

  static String? readRememberAccount() {
    return Storage.read(Keys.rememberAccount);
  }

  static void writeRememberAccount(String value) {
    Storage.write(Keys.rememberAccount, value);
  }

  static String? readPasswordAccount() {
    return Storage.read(Keys.rememberPassword);
  }

  static void writePasswordAccount(String value) {
    Storage.write(Keys.rememberPassword, value);
  }
}
