import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

ArticleTabEntity $ArticleTabEntityFromJson(Map<String, dynamic> json) {
  final ArticleTabEntity articleTabEntity = ArticleTabEntity();
  final List<ArticleEntity>? articleList =
      (json['articleList'] as List<dynamic>?)
          ?.map((e) => jsonConvert.convert<ArticleEntity>(e) as ArticleEntity)
          .toList();
  if (articleList != null) {
    articleTabEntity.articleList = articleList;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    articleTabEntity.author = author;
  }
  final List<ArticleTabEntity>? children = (json['children'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ArticleTabEntity>(e) as ArticleTabEntity)
      .toList();
  if (children != null) {
    articleTabEntity.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    articleTabEntity.courseId = courseId;
  }
  final String? cover = jsonConvert.convert<String>(json['cover']);
  if (cover != null) {
    articleTabEntity.cover = cover;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    articleTabEntity.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    articleTabEntity.id = id;
  }
  final String? lisense = jsonConvert.convert<String>(json['lisense']);
  if (lisense != null) {
    articleTabEntity.lisense = lisense;
  }
  final String? lisenseLink = jsonConvert.convert<String>(json['lisenseLink']);
  if (lisenseLink != null) {
    articleTabEntity.lisenseLink = lisenseLink;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    articleTabEntity.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    articleTabEntity.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    articleTabEntity.parentChapterId = parentChapterId;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    articleTabEntity.type = type;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    articleTabEntity.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    articleTabEntity.visible = visible;
  }
  return articleTabEntity;
}

Map<String, dynamic> $ArticleTabEntityToJson(ArticleTabEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['articleList'] = entity.articleList?.map((v) => v.toJson()).toList();
  data['author'] = entity.author;
  data['children'] = entity.children?.map((v) => v.toJson()).toList();
  data['courseId'] = entity.courseId;
  data['cover'] = entity.cover;
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['lisense'] = entity.lisense;
  data['lisenseLink'] = entity.lisenseLink;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['type'] = entity.type;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  return data;
}

extension ArticleTabEntityExtension on ArticleTabEntity {
  ArticleTabEntity copyWith({
    List<ArticleEntity>? articleList,
    String? author,
    List<ArticleTabEntity>? children,
    int? courseId,
    String? cover,
    String? desc,
    int? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    int? order,
    int? parentChapterId,
    int? type,
    bool? userControlSetTop,
    int? visible,
  }) {
    return ArticleTabEntity()
      ..articleList = articleList ?? this.articleList
      ..author = author ?? this.author
      ..children = children ?? this.children
      ..courseId = courseId ?? this.courseId
      ..cover = cover ?? this.cover
      ..desc = desc ?? this.desc
      ..id = id ?? this.id
      ..lisense = lisense ?? this.lisense
      ..lisenseLink = lisenseLink ?? this.lisenseLink
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..parentChapterId = parentChapterId ?? this.parentChapterId
      ..type = type ?? this.type
      ..userControlSetTop = userControlSetTop ?? this.userControlSetTop
      ..visible = visible ?? this.visible;
  }
}
