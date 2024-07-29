import 'dart:convert';

import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/structure_entity.g.dart';

///  知识体系和导航的model不一样，需要封装一下
class StructureEntity {
  String? name;
  String? link;
  int? id;

  /// 点击跳转的索引
  int index = 0;

  bool fromTree = false;

  List<StructureEntity>? items;

  StructureEntity({this.name, this.link, this.id, this.items});

  ///体系数据
  StructureEntity.transFromTree(ArticleTabEntity model) {
    name = model.name;
    items = model.children
        ?.map((e) => StructureEntity(name: e.name, id: e.id))
        .toList();
    fromTree = true;
  }

  ///导航数据
  StructureEntity.transFromNavi(NavigateEntity model) {
    name = model.name;
    items = model.articles
        ?.map((e) => StructureEntity(name: e.title, link: e.link))
        .toList();
    fromTree = false;
  }
}

@JsonSerializable()
class NavigateEntity {
  List<ArticleEntity>? articles;
  int? cid;
  String? name;

  NavigateEntity();

  factory NavigateEntity.fromJson(Map<String, dynamic> json) =>
      $NavigateEntityFromJson(json);

  Map<String, dynamic> toJson() => $NavigateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
