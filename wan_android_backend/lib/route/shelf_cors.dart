import 'package:shelf/shelf.dart';

/// 彻底放开
final _defaultHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Credentials': 'true',
  'Access-Control-Allow-Headers': '*',
  'Access-Control-Allow-Methods': '*',
  'Access-Control-Max-Age': '86400',
  'Content-Type': 'application/json;charset=utf-8',
};

final _defaultHeadersAll =
    _defaultHeaders.map((key, value) => MapEntry(key, [value]));

Middleware corsMiddleware({Map<String, String>? headers}) {
  final headersAll = headers?.map((key, value) => MapEntry(key, [value]));
  return (Handler handler) {
    return (Request request) async {
      final respHeaders = <String, List<String>>{
        ..._defaultHeadersAll,
        ...?headersAll,
      };

      if (request.method == 'OPTIONS') {
        return Response.ok(null, headers: respHeaders);
      }

      final response = await handler(request);

      return response.change(headers: {
        ...respHeaders,
        ...response.headersAll,
      });
    };
  };
}
