import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter_wan_android/core/init/storage.dart' as platform;

///  实现Cookie在各个平台的持久化
class CookieStorage extends Storage {
  @override
  Future<void> delete(String key) {
    return platform.Storage.remove(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) {
    return platform.Storage.clear(keys: keys);
  }

  @override
  Future<void> init(bool persistSession, bool ignoreExpires) async {}

  @override
  Future<String?> read(String key) async {
    return platform.Storage.read(key);
  }

  @override
  Future<void> write(String key, String value) {
    return platform.Storage.write(key, value);
  }
}
