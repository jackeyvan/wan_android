import 'dart:convert';

import 'package:flutter_wan_android/generated/json/banner_entity.g.dart';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';

export 'package:flutter_wan_android/generated/json/banner_entity.g.dart';

@JsonSerializable()
class BannerEntity {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  BannerEntity();

  factory BannerEntity.fromJson(Map<String, dynamic> json) =>
      $BannerEntityFromJson(json);

  Map<String, dynamic> toJson() => $BannerEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
