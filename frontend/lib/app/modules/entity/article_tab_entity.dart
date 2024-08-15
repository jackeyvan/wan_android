import 'dart:convert';

import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/generated/json/article_tab_entity.g.dart';
import 'package:wan_android/generated/json/base/json_field.dart';

export 'package:wan_android/generated/json/article_tab_entity.g.dart';

@JsonSerializable()
class ArticleTabEntity {
  List<ArticleEntity>? articleList;
  String? author;
  List<ArticleTabEntity>? children;
  int? courseId;
  String? cover;
  String? desc;
  int? id;
  String? lisense;
  String? lisenseLink;
  String? name;
  int? order;
  int? parentChapterId;
  int? type;
  bool? userControlSetTop;
  int? visible;

  ArticleTabEntity();

  factory ArticleTabEntity.fromJson(Map<String, dynamic> json) =>
      $ArticleTabEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleTabEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
