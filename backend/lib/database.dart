import 'package:get_storage/get_storage.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class Storage {
  static late GetStorage storage;

  static Future<void> init() async {
    await GetStorage.init();

    storage = GetStorage();
  }

  static String? read<T>(String key) => storage.read<String>(key);

  static Future<void> write(String key, dynamic value) =>
      storage.write(key, value);

  static Future<void> remove(String key) => storage.remove(key);

  static Future<void> clear({List<String>? keys}) {
    if (keys != null && keys.isNotEmpty) {
      ///  清除指定的 Key的集合
      return Future.wait(keys.map((e) => remove(e)));
    } else {
      ///  全部清除
      return storage.erase();
    }
  }
}