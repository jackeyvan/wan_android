import 'package:dio/dio.dart';
import 'package:flutter_wan_android/app/api/pgyer_repository.dart';
import 'package:flutter_wan_android/core/net/api_error.dart';
import 'package:flutter_wan_android/core/net/base_api.dart';
import 'package:flutter_wan_android/generated/json/base/json_convert_content.dart';

class PgyerApi extends BaseApi {
  @override
  void init(Dio dio) {
    dio.options.baseUrl = PgyerApiPaths.baseUrl;
    dio.interceptors.add(PgyerApiInterceptor());
  }

  @override
  T? convert<T>(dynamic json) {
    try {
      var result = PgyerResponse.fromJson(json);
      if (result.success) {
        final data = JsonConvert.fromJsonAsT<T>(result.data);
        return data ?? "" as T;
      } else {
        throw ApiError(message: result.msg, code: result.code);
      }
    } catch (error) {
      if (error is ApiError) rethrow;
      throw ApiError(message: ApiError.parseError, origin: error.toString());
    }
  }
}

class PgyerApiInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters["_api_key"] = "e5b445589e63283198ede7adebfd5aa6";
    options.queryParameters["appKey"] = "faf26a36b495a46d805ba54e24a82388";
    super.onRequest(options, handler);
  }
}

class PgyerResponse extends BaseResponse {
  @override
  bool get success => code == 0;

  PgyerResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['message'];
    data = json['data'];
  }
}
