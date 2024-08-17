import 'package:shelf/shelf.dart';
import 'package:wan_android_backend/const/constant.dart';

class BaseApi {
  final headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, PUT, POST, DELETE, HEAD, OPTIONS',
  };

  Response ok(dynamic data) {
    return Response.ok(data, headers: headers);
  }

  Response fail(dynamic data) {
    return Response(Constant.failCode, body: data, headers: headers);
  }
}
