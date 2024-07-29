import 'package:flutter_wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

ScoreRankListEntity $ScoreRankListEntityFromJson(Map<String, dynamic> json) {
  final ScoreRankListEntity scoreRankListEntity = ScoreRankListEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    scoreRankListEntity.curPage = curPage;
  }
  final List<ScoreRankEntity>? datas = (json['datas'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ScoreRankEntity>(e) as ScoreRankEntity)
      .toList();
  if (datas != null) {
    scoreRankListEntity.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    scoreRankListEntity.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    scoreRankListEntity.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    scoreRankListEntity.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    scoreRankListEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    scoreRankListEntity.total = total;
  }
  return scoreRankListEntity;
}

Map<String, dynamic> $ScoreRankListEntityToJson(ScoreRankListEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

extension ScoreRankListEntityExtension on ScoreRankListEntity {
  ScoreRankListEntity copyWith({
    int? curPage,
    List<ScoreRankEntity>? datas,
    int? offset,
    bool? over,
    int? pageCount,
    int? size,
    int? total,
  }) {
    return ScoreRankListEntity()
      ..curPage = curPage ?? this.curPage
      ..datas = datas ?? this.datas
      ..offset = offset ?? this.offset
      ..over = over ?? this.over
      ..pageCount = pageCount ?? this.pageCount
      ..size = size ?? this.size
      ..total = total ?? this.total;
  }
}

ScoreRankEntity $ScoreRankEntityFromJson(Map<String, dynamic> json) {
  final ScoreRankEntity scoreRankEntity = ScoreRankEntity();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    scoreRankEntity.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    scoreRankEntity.level = level;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    scoreRankEntity.nickname = nickname;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    scoreRankEntity.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    scoreRankEntity.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    scoreRankEntity.username = username;
  }
  return scoreRankEntity;
}

Map<String, dynamic> $ScoreRankEntityToJson(ScoreRankEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

extension ScoreRankEntityExtension on ScoreRankEntity {
  ScoreRankEntity copyWith({
    int? coinCount,
    int? level,
    String? nickname,
    String? rank,
    int? userId,
    String? username,
  }) {
    return ScoreRankEntity()
      ..coinCount = coinCount ?? this.coinCount
      ..level = level ?? this.level
      ..nickname = nickname ?? this.nickname
      ..rank = rank ?? this.rank
      ..userId = userId ?? this.userId
      ..username = username ?? this.username;
  }
}
