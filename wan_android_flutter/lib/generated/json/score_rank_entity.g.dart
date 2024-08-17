import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/generated/json/base/json_convert_content.dart';

ScoreListEntity $ScoreListEntityFromJson(Map<String, dynamic> json) {
  final ScoreListEntity scoreListEntity = ScoreListEntity();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    scoreListEntity.curPage = curPage;
  }
  final List<ScoreEntity>? datas = (json['datas'] as List<dynamic>?)
      ?.map((e) => jsonConvert.convert<ScoreEntity>(e) as ScoreEntity)
      .toList();
  if (datas != null) {
    scoreListEntity.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    scoreListEntity.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    scoreListEntity.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    scoreListEntity.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    scoreListEntity.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    scoreListEntity.total = total;
  }
  return scoreListEntity;
}

Map<String, dynamic> $ScoreListEntityToJson(ScoreListEntity entity) {
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

extension ScoreListEntityExtension on ScoreListEntity {
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

ScoreEntity $ScoreEntityFromJson(Map<String, dynamic> json) {
  final ScoreEntity scoreEntity = ScoreEntity();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    scoreEntity.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    scoreEntity.level = level;
  }
  final int? date = jsonConvert.convert<int>(json['date']);
  if (date != null) {
    scoreEntity.date = date;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    scoreEntity.nickname = nickname;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    scoreEntity.desc = desc;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    scoreEntity.rank = rank;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    scoreEntity.reason = reason;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    scoreEntity.userId = userId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    scoreEntity.id = id;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    scoreEntity.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    scoreEntity.username = username;
  }
  return scoreEntity;
}

Map<String, dynamic> $ScoreEntityToJson(ScoreEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['date'] = entity.date;
  data['nickname'] = entity.nickname;
  data['desc'] = entity.desc;
  data['rank'] = entity.rank;
  data['reason'] = entity.reason;
  data['userId'] = entity.userId;
  data['id'] = entity.id;
  data['type'] = entity.type;
  data['username'] = entity.username;
  return data;
}

extension ScoreEntityExtension on ScoreEntity {
  ScoreEntity copyWith({
    int? coinCount,
    int? level,
    int? date,
    String? nickname,
    String? desc,
    String? rank,
    String? reason,
    int? userId,
    int? id,
    int? type,
    String? username,
  }) {
    return ScoreEntity()
      ..coinCount = coinCount ?? this.coinCount
      ..level = level ?? this.level
      ..date = date ?? this.date
      ..nickname = nickname ?? this.nickname
      ..desc = desc ?? this.desc
      ..rank = rank ?? this.rank
      ..reason = reason ?? this.reason
      ..userId = userId ?? this.userId
      ..id = id ?? this.id
      ..type = type ?? this.type
      ..username = username ?? this.username;
  }
}
