import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:flutter_wan_android/app/api/cookie/cookie_interceptor.dart';
import 'package:flutter_wan_android/app/api/cookie/cookie_storage.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/modules/entity/user_entity.dart';
import 'package:flutter_wan_android/core/net/api_error.dart';
import 'package:flutter_wan_android/core/net/base_api.dart';
import 'package:flutter_wan_android/core/net/cache/cache.dart';
import 'package:flutter_wan_android/core/net/cache/cache_Interceptor.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

/// 玩安卓的API初始化
class WanAndroidApi extends BaseApi {
  @override
  void init(Dio dio) {
    dio.options.baseUrl = WanAndroidApiPaths.baseUrl;

    dio.options.connectTimeout = const Duration(seconds: 15);
    dio.options.receiveTimeout = const Duration(seconds: 15);
    dio.options.sendTimeout = const Duration(seconds: 15);

    /// 缓存拦截器
    dio.interceptors.add(CacheInterceptor(
        defaultCacheMode: CacheMode.cacheFirstThenRemote,
        defaultExpireTime: const Duration(days: 7)));

    /// Cookie持久化
    dio.interceptors
        .add(CookieInterceptor(PersistCookieJar(storage: CookieStorage())));

    /// 添加业务拦截器，公共参数和解析等
    dio.interceptors.add((ApiInterceptor()));
  }

  ///  请求的host
  String get baseUrl => dio.options.baseUrl;

  /// 数据转换
  @override
  T? convert<T>(dynamic json) {
    try {
      var result = ApiResponse.fromJson(json);
      if (result.success) {
        final data = JsonConvert.fromJsonAsT<T>(result.data);

        /// 返回成功，数据可能为null
        return data;
      } else {
        /// 请求不成功
        if (result.code == -1001) {
          /// Cookie过期，清除本地Cookie和用户信息
          User.clear();
        }
        throw ApiError(message: result.msg, code: result.code);
      }
    } catch (error) {
      if (error is ApiError) {
        rethrow;
      }
      throw ApiError(message: ApiError.parseError, origin: error.toString());
    }
  }
}

/// 业务拦截器，添加具体的公共参数
class ApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['version'] = "1.0.0";
    options.headers['platform'] = "android";

    super.onRequest(options, handler);
  }
}

/// 响应基类转换
class ApiResponse extends BaseResponse {
  @override
  bool get success => code == 0;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    code = json['errorCode'];
    msg = json['errorMsg'];
    data = json['data'];
  }
}
