import 'package:flutter_wan_android/app/modules/entity/user_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

User $UserFromJson(Map<String, dynamic> json) {
  final User user = User();
  final bool? admin = jsonConvert.convert<bool>(json['admin']);
  if (admin != null) {
    user.admin = admin;
  }
  final List<dynamic>? chapterTops =
      (json['chapterTops'] as List<dynamic>?)?.map((e) => e).toList();
  if (chapterTops != null) {
    user.chapterTops = chapterTops;
  }
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    user.coinCount = coinCount;
  }
  final List<dynamic>? collectIds =
      (json['collectIds'] as List<dynamic>?)?.map((e) => e).toList();
  if (collectIds != null) {
    user.collectIds = collectIds;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    user.email = email;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    user.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    user.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    user.nickname = nickname;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    user.password = password;
  }
  final String? publicName = jsonConvert.convert<String>(json['publicName']);
  if (publicName != null) {
    user.publicName = publicName;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    user.token = token;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    user.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    user.username = username;
  }
  return user;
}

Map<String, dynamic> $UserToJson(User entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['admin'] = entity.admin;
  data['chapterTops'] = entity.chapterTops;
  data['coinCount'] = entity.coinCount;
  data['collectIds'] = entity.collectIds;
  data['email'] = entity.email;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['password'] = entity.password;
  data['publicName'] = entity.publicName;
  data['token'] = entity.token;
  data['type'] = entity.type;
  data['username'] = entity.username;
  return data;
}

extension UserExtension on User {
  User copyWith({
    bool? admin,
    List<dynamic>? chapterTops,
    int? coinCount,
    List<dynamic>? collectIds,
    String? email,
    String? icon,
    int? id,
    String? nickname,
    String? password,
    String? publicName,
    String? token,
    int? type,
    String? username,
  }) {
    return User()
      ..admin = admin ?? this.admin
      ..chapterTops = chapterTops ?? this.chapterTops
      ..coinCount = coinCount ?? this.coinCount
      ..collectIds = collectIds ?? this.collectIds
      ..email = email ?? this.email
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..nickname = nickname ?? this.nickname
      ..password = password ?? this.password
      ..publicName = publicName ?? this.publicName
      ..token = token ?? this.token
      ..type = type ?? this.type
      ..username = username ?? this.username;
  }
}
