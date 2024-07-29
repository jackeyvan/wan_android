import 'dart:convert';

import 'package:flutter_wan_android/generated/json/base/json_field.dart';
import 'package:flutter_wan_android/generated/json/score_rank_entity.g.dart';

export 'package:flutter_wan_android/generated/json/score_rank_entity.g.dart';

@JsonSerializable()
class ScoreRankListEntity {
  int? curPage;
  List<ScoreRankEntity>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ScoreRankListEntity();

  factory ScoreRankListEntity.fromJson(Map<String, dynamic> json) =>
      $ScoreRankListEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoreRankListEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ScoreRankEntity {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  ScoreRankEntity();

  factory ScoreRankEntity.fromJson(Map<String, dynamic> json) =>
      $ScoreRankEntityFromJson(json);

  Map<String, dynamic> toJson() => $ScoreRankEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
