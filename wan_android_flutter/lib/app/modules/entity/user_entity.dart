import 'dart:async';
import 'dart:convert';

import 'package:wan_android/app/const/keys.dart';
import 'package:wan_android/core/init/storage.dart';
import 'package:wan_android/generated/json/base/json_field.dart';
import 'package:wan_android/generated/json/user_entity.g.dart';

export 'package:wan_android/generated/json/user_entity.g.dart';

@JsonSerializable()
class User {
  bool? admin;
  List<dynamic>? chapterTops;
  int? coinCount;
  List<dynamic>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  User();

  static final streamController = StreamController<User>();

  static User? _user;

  /// 获取用户信息
  static User? getUser() {
    if (_user != null) return _user;

    final json = Storage.read(Keys.userKey);
    if (json != null) {
      _user = $UserFromJson(json);
    }

    return _user;
  }

  /// 根据本地信息判断用户是否登录
  static bool isLogin() {
    return getUser() != null;
  }

  /// 清除用户信息
  static Future<void> clear() async {
    _user = null;
    Storage.remove(Keys.userKey);
  }

  static saveUser(User user) {
    _user = user;
    streamController.add(user);

    /// 解析User数据时，保存到本地
    Storage.write(Keys.userKey, user);
  }

  Map<String, dynamic> toJson() => $UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => $UserFromJson(json);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
