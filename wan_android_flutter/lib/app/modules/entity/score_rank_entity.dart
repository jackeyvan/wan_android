import 'dart:convert';

import 'package:wan_android/generated/json/base/json_field.dart';
import 'package:wan_android/generated/json/score_rank_entity.g.dart';

export 'package:wan_android/generated/json/score_rank_entity.g.dart';

@JsonSerializable()
class ScoreListEntity {
  int? curPage;
  List<ScoreEntity>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ScoreListEntity();

  factory ScoreListEntity.fromJson(Map<String, dynamic> json) =>
      $ScoreListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoreListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ScoreEntity {
  int? coinCount;
  int? level;
  int? date;
  String? nickname;
  String? desc;
  String? rank;
  String? reason;
  int? userId;
  int? id;
  int? type;
  String? username;

  ScoreEntity();

  factory ScoreEntity.fromJson(Map<String, dynamic> json) =>
      $ScoreEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoreEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
