import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/structure_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

NavigateEntity $NavigateEntityFromJson(Map<String, dynamic> json) {
  final NavigateEntity navigateEntity = NavigateEntity();
  final List<ArticleEntity>? articles = (json['articles'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ArticleEntity>(e) as ArticleEntity)
      .toList();
  if (articles != null) {
    navigateEntity.articles = articles;
  }
  final int? cid = jsonConvert.convert<int>(json['cid']);
  if (cid != null) {
    navigateEntity.cid = cid;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    navigateEntity.name = name;
  }
  return navigateEntity;
}

Map<String, dynamic> $NavigateEntityToJson(NavigateEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articles'] = entity.articles?.map((v) => v.toJson()).toList();
  data['cid'] = entity.cid;
  data['name'] = entity.name;
  return data;
}

extension NavigateEntityExtension on NavigateEntity {
  NavigateEntity copyWith({
    List<ArticleEntity>? articles,
    int? cid,
    String? name,
  }) {
    return NavigateEntity()
      ..articles = articles ?? this.articles
      ..cid = cid ?? this.cid
      ..name = name ?? this.name;
  }
}
