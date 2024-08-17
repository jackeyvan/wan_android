import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/entity/user_info_entity.dart';
import 'package:wan_android/generated/json/base/json_convert_content.dart';

UserInfoEntity $UserInfoEntityFromJson(Map<String, dynamic> json) {
  final UserInfoEntity userInfoEntity = UserInfoEntity();
  final UserCoinInfo? coinInfo =
      jsonConvert.convert<UserCoinInfo>(json['coinInfo']);
  if (coinInfo != null) {
    userInfoEntity.coinInfo = coinInfo;
  }
  final UserCollectArticleInfo? collectArticleInfo =
      jsonConvert.convert<UserCollectArticleInfo>(json['collectArticleInfo']);
  if (collectArticleInfo != null) {
    userInfoEntity.collectArticleInfo = collectArticleInfo;
  }
  final User? userInfo = jsonConvert.convert<User>(json['userInfo']);
  if (userInfo != null) {
    userInfoEntity.userInfo = userInfo;
  }
  return userInfoEntity;
}

Map<String, dynamic> $UserInfoEntityToJson(UserInfoEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinInfo'] = entity.coinInfo?.toJson();
  data['collectArticleInfo'] = entity.collectArticleInfo?.toJson();
  data['userInfo'] = entity.userInfo?.toJson();
  return data;
}

extension UserInfoEntityExtension on UserInfoEntity {
  UserInfoEntity copyWith({
    UserCoinInfo? coinInfo,
    UserCollectArticleInfo? collectArticleInfo,
    User? userInfo,
  }) {
    return UserInfoEntity()
      ..coinInfo = coinInfo ?? this.coinInfo
      ..collectArticleInfo = collectArticleInfo ?? this.collectArticleInfo
      ..userInfo = userInfo ?? this.userInfo;
  }
}

UserCoinInfo $UserCoinInfoFromJson(Map<String, dynamic> json) {
  final UserCoinInfo userCoinInfo = UserCoinInfo();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    userCoinInfo.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userCoinInfo.level = level;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userCoinInfo.nickname = nickname;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    userCoinInfo.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userCoinInfo.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userCoinInfo.username = username;
  }
  return userCoinInfo;
}

Map<String, dynamic> $UserCoinInfoToJson(UserCoinInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

extension UserCoinInfoExtension on UserCoinInfo {
  UserCoinInfo copyWith({
    int? coinCount,
    int? level,
    String? nickname,
    String? rank,
    int? userId,
    String? username,
  }) {
    return UserCoinInfo()
      ..coinCount = coinCount ?? this.coinCount
      ..level = level ?? this.level
      ..nickname = nickname ?? this.nickname
      ..rank = rank ?? this.rank
      ..userId = userId ?? this.userId
      ..username = username ?? this.username;
  }
}

UserCollectArticleInfo $UserCollectArticleInfoFromJson(
    Map<String, dynamic> json) {
  final UserCollectArticleInfo userCollectArticleInfo =
      UserCollectArticleInfo();
  final int? count = jsonConvert.convert<int>(json['count']);
  if (count != null) {
    userCollectArticleInfo.count = count;
  }
  return userCollectArticleInfo;
}

Map<String, dynamic> $UserCollectArticleInfoToJson(
    UserCollectArticleInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['count'] = entity.count;
  return data;
}

extension UserCollectArticleInfoExtension on UserCollectArticleInfo {
  UserCollectArticleInfo copyWith({
    int? count,
  }) {
    return UserCollectArticleInfo()..count = count ?? this.count;
  }
}
