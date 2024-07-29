import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/hot_key_entity.g.dart';

export 'package:flutter_wan_android/generated/json/hot_key_entity.g.dart';

@JsonSerializable()
class HotKeyEntity {
  double? id;
  String? link;
  String? name;
  double? order;
  double? visible;

  /// 历史搜索记录
  bool isHistory = false;

  HotKeyEntity();

  factory HotKeyEntity.fromJson(Map<String, dynamic> json) =>
      $HotKeyEntityFromJson(json);

  Map<String, dynamic> toJson() => $HotKeyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
