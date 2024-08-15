import 'package:get_storage/get_storage.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class Storage {
  static late GetStorage _storage;

  static Future<void> init() async {
    await GetStorage.init();

    _storage = GetStorage();
  }

  static String? read<T>(String key) => _storage.read<String>(key);

  static Future<void> write(String key, dynamic value) =>
      _storage.write(key, value);

  static Future<void> remove(String key) => _storage.remove(key);

  static Future<void> clear({List<String>? keys}) {
    if (keys != null && keys.isNotEmpty) {
      ///  清除指定的 Key的集合
      return Future.wait(keys.map((e) => remove(e)));
    } else {
      ///  全部清除
      return _storage.erase();
    }
  }
}
