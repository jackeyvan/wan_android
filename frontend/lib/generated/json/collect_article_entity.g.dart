import 'package:wan_android/app/modules/entity/collect_article_entity.dart';
import 'package:wan_android/generated/json/base/json_convert_content.dart';

CollectArticleEntity $CollectArticleEntityFromJson(Map<String, dynamic> json) {
  final CollectArticleEntity collectArticleEntity = CollectArticleEntity();
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    collectArticleEntity.desc = desc;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    collectArticleEntity.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    collectArticleEntity.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    collectArticleEntity.link = link;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    collectArticleEntity.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    collectArticleEntity.order = order;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    collectArticleEntity.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    collectArticleEntity.visible = visible;
  }
  return collectArticleEntity;
}

Map<String, dynamic> $CollectArticleEntityToJson(CollectArticleEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['desc'] = entity.desc;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  return data;
}

extension CollectArticleEntityExtension on CollectArticleEntity {
  CollectArticleEntity copyWith({
    String? desc,
    String? icon,
    int? id,
    String? link,
    String? name,
    int? order,
    int? userId,
    int? visible,
  }) {
    return CollectArticleEntity()
      ..desc = desc ?? this.desc
      ..icon = icon ?? this.icon
      ..id = id ?? this.id
      ..link = link ?? this.link
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..userId = userId ?? this.userId
      ..visible = visible ?? this.visible;
  }
}
