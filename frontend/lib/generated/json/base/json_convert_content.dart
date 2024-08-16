// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart' show debugPrint;
import 'package:wan_android/app/modules/entity/app_info_entity.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/entity/article_tab_entity.dart';
import 'package:wan_android/app/modules/entity/banner_entity.dart';
import 'package:wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:wan_android/app/modules/entity/score_rank_entity.dart';
import 'package:wan_android/app/modules/entity/structure_entity.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/modules/entity/user_info_entity.dart';

JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);
typedef ConvertExceptionHandler = void Function(
    Object error, StackTrace stackTrace);

extension MapSafeExt<K, V> on Map<K, V> {
  T? getOrNull<T>(K? key) {
    if (!containsKey(key) || key == null) {
      return null;
    } else {
      return this[key] as T?;
    }
  }
}

class JsonConvert {
  static ConvertExceptionHandler? onError;
  JsonConvertClassCollection convertFuncMap = JsonConvertClassCollection();

  /// When you are in the development, to generate a new model class, hot-reload doesn't find new generation model class, you can build on MaterialApp method called jsonConvert. ReassembleConvertFuncMap (); This method only works in a development environment
  /// https://flutter.cn/docs/development/tools/hot-reload
  /// class MyApp extends StatelessWidget {
  ///    const MyApp({Key? key})
  ///        : super(key: key);
  ///
  ///    @override
  ///    Widget build(BuildContext context) {
  ///      jsonConvert.reassembleConvertFuncMap();
  ///      return MaterialApp();
  ///    }
  /// }
  void reassembleConvertFuncMap() {
    bool isReleaseMode = const bool.fromEnvironment('dart.vm.product');
    if (!isReleaseMode) {
      convertFuncMap = JsonConvertClassCollection();
    }
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>)
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!)
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      if (onError != null) {
        onError!(e, stackTrace);
      }
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        if (value == null) {
          return null;
        }
        var covertFunc = convertFuncMap[type]!;
        if (covertFunc is Map<String, dynamic>) {
          return covertFunc(value as Map<String, dynamic>) as T;
        } else {
          return covertFunc(Map<String, dynamic>.from(value)) as T;
        }
      } else {
        throw UnimplementedError(
            '$type unimplemented,you can try running the app again');
      }
    }
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<AppInfoEntity>[] is M) {
      return data
          .map<AppInfoEntity>(
              (Map<String, dynamic> e) => AppInfoEntity.fromJson(e))
          .toList() as M;
    }
    if (<ArticleListEntity>[] is M) {
      return data
          .map<ArticleListEntity>(
              (Map<String, dynamic> e) => ArticleListEntity.fromJson(e))
          .toList() as M;
    }
    if (<ArticleEntity>[] is M) {
      return data
          .map<ArticleEntity>(
              (Map<String, dynamic> e) => ArticleEntity.fromJson(e))
          .toList() as M;
    }
    if (<ArticleTags>[] is M) {
      return data
          .map<ArticleTags>((Map<String, dynamic> e) => ArticleTags.fromJson(e))
          .toList() as M;
    }
    if (<ArticleTabEntity>[] is M) {
      return data
          .map<ArticleTabEntity>(
              (Map<String, dynamic> e) => ArticleTabEntity.fromJson(e))
          .toList() as M;
    }
    if (<BannerEntity>[] is M) {
      return data
          .map<BannerEntity>(
              (Map<String, dynamic> e) => BannerEntity.fromJson(e))
          .toList() as M;
    }
    if (<HotKeyEntity>[] is M) {
      return data
          .map<HotKeyEntity>(
              (Map<String, dynamic> e) => HotKeyEntity.fromJson(e))
          .toList() as M;
    }
    if (<ScoreRankListEntity>[] is M) {
      return data
          .map<ScoreRankListEntity>(
              (Map<String, dynamic> e) => ScoreRankListEntity.fromJson(e))
          .toList() as M;
    }
    if (<ScoreRankEntity>[] is M) {
      return data
          .map<ScoreRankEntity>(
              (Map<String, dynamic> e) => ScoreRankEntity.fromJson(e))
          .toList() as M;
    }
    if (<NavigateEntity>[] is M) {
      return data
          .map<NavigateEntity>(
              (Map<String, dynamic> e) => NavigateEntity.fromJson(e))
          .toList() as M;
    }
    if (<User>[] is M) {
      return data
          .map<User>((Map<String, dynamic> e) => User.fromJson(e))
          .toList() as M;
    }
    if (<UserInfoEntity>[] is M) {
      return data
          .map<UserInfoEntity>(
              (Map<String, dynamic> e) => UserInfoEntity.fromJson(e))
          .toList() as M;
    }
    if (<UserCoinInfo>[] is M) {
      return data
          .map<UserCoinInfo>(
              (Map<String, dynamic> e) => UserCoinInfo.fromJson(e))
          .toList() as M;
    }
    if (<UserCollectArticleInfo>[] is M) {
      return data
          .map<UserCollectArticleInfo>(
              (Map<String, dynamic> e) => UserCollectArticleInfo.fromJson(e))
          .toList() as M;
    }

    debugPrint("$M not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is M) {
      return json;
    }
    if (json is List) {
      return _getListChildType<M>(
          json.map((dynamic e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}

class JsonConvertClassCollection {
  Map<String, JsonConvertFunction> convertFuncMap = {
    (AppInfoEntity).toString(): AppInfoEntity.fromJson,
    (ArticleListEntity).toString(): ArticleListEntity.fromJson,
    (ArticleEntity).toString(): ArticleEntity.fromJson,
    (ArticleTags).toString(): ArticleTags.fromJson,
    (ArticleTabEntity).toString(): ArticleTabEntity.fromJson,
    (BannerEntity).toString(): BannerEntity.fromJson,
    (HotKeyEntity).toString(): HotKeyEntity.fromJson,
    (ScoreRankListEntity).toString(): ScoreRankListEntity.fromJson,
    (ScoreRankEntity).toString(): ScoreRankEntity.fromJson,
    (NavigateEntity).toString(): NavigateEntity.fromJson,
    (User).toString(): User.fromJson,
    (UserInfoEntity).toString(): UserInfoEntity.fromJson,
    (UserCoinInfo).toString(): UserCoinInfo.fromJson,
    (UserCollectArticleInfo).toString(): UserCollectArticleInfo.fromJson,
  };

  bool containsKey(String type) {
    return convertFuncMap.containsKey(type);
  }

  JsonConvertFunction? operator [](String key) {
    return convertFuncMap[key];
  }
}
