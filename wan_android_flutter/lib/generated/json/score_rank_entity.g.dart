import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/generated/json/base/json_convert_content.dart';

ScoreListEntity $ScoreRankListEntityFromJson(Map<String, dynamic> json) {
  final ScoreListEntity scoreRankListEntity = ScoreListEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    scoreRankListEntity.curPage = curPage;
  }
  final List<ScoreEntity>? datas = (json['datas'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ScoreEntity>(e) as ScoreEntity)
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

Map<String, dynamic> $ScoreRankListEntityToJson(ScoreListEntity entity) {
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

extension ScoreRankListEntityExtension on ScoreListEntity {
  ScoreListEntity copyWith({
    int? curPage,
    List<ScoreEntity>? datas,
    int? offset,
    bool? over,
    int? pageCount,
    int? size,
    int? total,
  }) {
    return ScoreListEntity()
      ..curPage = curPage ?? this.curPage
      ..datas = datas ?? this.datas
      ..offset = offset ?? this.offset
      ..over = over ?? this.over
      ..pageCount = pageCount ?? this.pageCount
      ..size = size ?? this.size
      ..total = total ?? this.total;
  }
}

ScoreEntity $ScoreRankEntityFromJson(Map<String, dynamic> json) {
  final ScoreEntity scoreRankEntity = ScoreEntity();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    scoreRankEntity.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    scoreRankEntity.level = level;
  }
  final int? date = jsonConvert.convert<int>(json['date']);
  if (date != null) {
    scoreRankEntity.date = date;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    scoreRankEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    scoreRankEntity.type = type;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    scoreRankEntity.nickname = nickname;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    scoreRankEntity.desc = desc;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    scoreRankEntity.reason = reason;
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

Map<String, dynamic> $ScoreRankEntityToJson(ScoreEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  data['date'] = entity.date;
  data['desc'] = entity.desc;
  data['reason'] = entity.reason;
  data['id'] = entity.id;
  data['type'] = entity.type;
  return data;
}

extension ScoreRankEntityExtension on ScoreEntity {
  ScoreEntity copyWith(
      {int? coinCount,
      int? level,
      String? nickname,
      String? rank,
      int? userId,
      String? username,
      int? date,
      String? desc,
      String? reason,
      int? id,
      int? type}) {
    return ScoreEntity()
      ..coinCount = coinCount ?? this.coinCount
      ..level = level ?? this.level
      ..nickname = nickname ?? this.nickname
      ..rank = rank ?? this.rank
      ..userId = userId ?? this.userId
      ..username = username ?? this.username
      ..date = date ?? this.date
      ..desc = desc ?? this.desc
      ..reason = reason ?? this.reason
      ..id = id ?? this.id
      ..type = type ?? this.type;
  }
}
