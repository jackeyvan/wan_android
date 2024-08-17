import 'package:hive/hive.dart';

/// 对外暴露的静态类，直接调用存储
/// 内部实现过内存缓存和离线缓存，可以直接使用
class HiveBox {
  static late Box<String> _box;
  static final boxKey = "WanAndroid";

  static Future<void> init() async {
    Hive.init("database");

    _box = await Hive.openBox(boxKey);
  }

  static String? get<T>(String key) => _box.get(key);

  static Future<void> put(String key, dynamic value) => _box.put(key, value);

  static Future<void> delete(String key) => _box.delete(key);

  static Future<void> clear({List<String>? keys}) {
    if (keys != null && keys.isNotEmpty) {
      ///  清除指定的 Key的集合
      return Future.wait(keys.map((e) => delete(e)));
    } else {
      ///  全部清除
      return _box.clear();
    }
  }
}
