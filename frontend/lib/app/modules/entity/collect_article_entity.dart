import 'dart:convert';

import 'package:wan_android/generated/json/base/json_field.dart';
import 'package:wan_android/generated/json/collect_article_entity.g.dart';

export 'package:wan_android/generated/json/collect_article_entity.g.dart';

@JsonSerializable()
class CollectArticleEntity {
  String? desc;
  String? icon;
  int? id;
  String? link;
  String? name;
  int? order;
  int? userId;
  int? visible;

  CollectArticleEntity();

  factory CollectArticleEntity.fromJson(Map<String, dynamic> json) =>
      $CollectArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
