import 'dart:convert';

import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/generated/json/base/json_field.dart';
import 'package:wan_android/generated/json/user_info_entity.g.dart';

@JsonSerializable()
class UserInfoEntity {
  UserCoinInfo? coinInfo;
  UserCollectArticleInfo? collectArticleInfo;
  User? userInfo;

  UserInfoEntity();

  factory UserInfoEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserCoinInfo {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  UserCoinInfo();

  factory UserCoinInfo.fromJson(Map<String, dynamic> json) =>
      $UserCoinInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserCoinInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserCollectArticleInfo {
  int? count;

  UserCollectArticleInfo();

  factory UserCollectArticleInfo.fromJson(Map<String, dynamic> json) =>
      $UserCollectArticleInfoFromJson(json);

  Map<String, dynamic> toJson() => $UserCollectArticleInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
