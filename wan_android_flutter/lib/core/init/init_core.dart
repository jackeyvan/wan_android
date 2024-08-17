import 'package:crypto/crypto.dart' as crypto;

/// 顶级函数
/// 初始化一些常用的方法
/// 初始化一些常用的引用对象

String md5(String data) {
  return crypto.md5.convert(data.codeUnits).toString();
}

///  字符串是否为空
bool isNullOrBlank(String? data) {
  if (data == null) {
    return true;
  } else {
    return data.trim().isEmpty;
  }
}

/// 字符串不为空
bool isNotNullOrBlank(String? data) {
  return !isNullOrBlank(data);
}
