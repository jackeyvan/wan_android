/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports
// ignore_for_file: use_super_parameters
// ignore_for_file: type_literal_in_constant_pattern

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'article_model.dart' as _i2;
import 'banner_model.dart' as _i3;
import 'package:wan_android_shared/src/api_response.dart' as _i4;
export 'article_model.dart';
export 'banner_model.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.ArticleModel) {
      return _i2.ArticleModel.fromJson(data) as T;
    }
    if (t == _i3.BannerModel) {
      return _i3.BannerModel.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.ArticleModel?>()) {
      return (data != null ? _i2.ArticleModel.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.BannerModel?>()) {
      return (data != null ? _i3.BannerModel.fromJson(data) : null) as T;
    }
    if (t == _i4.ApiResponse) {
      return _i4.ApiResponse.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.ApiResponse?>()) {
      return (data != null ? _i4.ApiResponse.fromJson(data) : null) as T;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i4.ApiResponse) {
      return 'ApiResponse';
    }
    if (data is _i2.ArticleModel) {
      return 'ArticleModel';
    }
    if (data is _i3.BannerModel) {
      return 'BannerModel';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'ApiResponse') {
      return deserialize<_i4.ApiResponse>(data['data']);
    }
    if (data['className'] == 'ArticleModel') {
      return deserialize<_i2.ArticleModel>(data['data']);
    }
    if (data['className'] == 'BannerModel') {
      return deserialize<_i3.BannerModel>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
