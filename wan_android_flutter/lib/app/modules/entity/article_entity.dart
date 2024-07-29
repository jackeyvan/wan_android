import 'dart:convert';

import 'package:flutter_wan_android/app/modules/entity/banner_entity.dart';
import 'package:flutter_wan_android/generated/json/article_entity.g.dart';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';

export 'package:flutter_wan_android/generated/json/article_entity.g.dart';

@JsonSerializable()
class ArticleListEntity {
  int? curPage;
  List<ArticleEntity>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ArticleListEntity();

  factory ArticleListEntity.fromJson(Map<String, dynamic> json) =>
      $ArticleListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleEntity {
  bool? adminAdd;
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  bool? isAdminAdd;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<ArticleTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  /// 兼容首页的Banner
  List<BannerEntity>? banner;

  ArticleEntity({
    this.title,
    this.link,
    this.banner,
  });

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      $ArticleEntityFromJson(json);

  Map<String, dynamic> toJson() => $ArticleEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ArticleTags {
  String? name;
  String? url;

  ArticleTags({this.name});

  factory ArticleTags.fromJson(Map<String, dynamic> json) =>
      $ArticleTagsFromJson(json);

  Map<String, dynamic> toJson() => $ArticleTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
