import 'package:flutter_wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

HotKeyEntity $HotKeyEntityFromJson(Map<String, dynamic> json) {
  final HotKeyEntity hotKeyEntity = HotKeyEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    hotKeyEntity.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    hotKeyEntity.link = link;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    hotKeyEntity.name = name;
  }
  final double? order = jsonConvert.convert<double>(json['order']);
  if (order != null) {
    hotKeyEntity.order = order;
  }
  final double? visible = jsonConvert.convert<double>(json['visible']);
  if (visible != null) {
    hotKeyEntity.visible = visible;
  }
  return hotKeyEntity;
}

Map<String, dynamic> $HotKeyEntityToJson(HotKeyEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['visible'] = entity.visible;
  return data;
}

extension HotKeyEntityExtension on HotKeyEntity {
  HotKeyEntity copyWith({
    double? id,
    String? link,
    String? name,
    double? order,
    double? visible,
  }) {
    return HotKeyEntity()
      ..id = id ?? this.id
      ..link = link ?? this.link
      ..name = name ?? this.name
      ..order = order ?? this.order
      ..visible = visible ?? this.visible;
  }
}
