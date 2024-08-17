import 'package:shelf/shelf.dart';
import 'package:wan_android_backend/const/constant.dart';

class BaseApi {
  Response ok(dynamic data) {
    return Response.ok(data, headers: {'Content-Type': 'application/json'});
  }

  Response fail(dynamic data) {
    return Response(Constant.failCode,
        body: data, headers: {'Content-Type': 'application/json'});
  }
}
