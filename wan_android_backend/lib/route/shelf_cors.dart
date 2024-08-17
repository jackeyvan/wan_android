import 'package:shelf/shelf.dart';

const ACCESS_CONTROL_ALLOW_ORIGIN = 'Access-Control-Allow-Origin';
const ACCESS_CONTROL_EXPOSE_HEADERS = 'Access-Control-Expose-Headers';
const ACCESS_CONTROL_ALLOW_CREDENTIALS = 'Access-Control-Allow-Credentials';
const ACCESS_CONTROL_ALLOW_HEADERS = 'Access-Control-Allow-Headers';
const ACCESS_CONTROL_ALLOW_METHODS = 'Access-Control-Allow-Methods';
const ACCESS_CONTROL_MAX_AGE = 'Access-Control-Max-Age';
const VARY = 'Vary';

const ORIGIN = 'origin';

const _defaultHeadersList = [
  'accept',
  'accept-encoding',
  'authorization',
  'content-type',
  'dnt',
  'origin',
  'user-agent',
];

const _defaultMethodsList = [
  'DELETE',
  'GET',
  'OPTIONS',
  'PATCH',
  'POST',
  'PUT'
];

Map<String, String> _defaultHeaders = {
  ACCESS_CONTROL_ALLOW_CREDENTIALS: 'true',
  ACCESS_CONTROL_ALLOW_HEADERS: _defaultHeadersList.join(','),
  ACCESS_CONTROL_ALLOW_METHODS: _defaultMethodsList.join(','),
  ACCESS_CONTROL_MAX_AGE: '86400',
};

final _defaultHeadersAll =
    _defaultHeaders.map((key, value) => MapEntry(key, [value]));

Middleware corsHeaders({Map<String, String>? headers}) {
  final headersAll = headers?.map((key, value) => MapEntry(key, [value]));
  return (Handler handler) {
    return (Request request) async {
      final respHeaders = <String, List<String>>{
        ..._defaultHeadersAll,
        ...?headersAll,
      };

      respHeaders[ACCESS_CONTROL_ALLOW_ORIGIN] = ["*"];

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
