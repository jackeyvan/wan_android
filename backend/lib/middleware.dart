import 'dart:async';

import 'package:shelf/shelf.dart';

typedef Middleware = Handler Function(Handler innerHandler);
typedef Handler = FutureOr<Response> Function(Request request);

Middleware rejectBadRequests() {
  return (innerHandler) {
    return (request) {
      if (request.method != 'GET') {
        return Response(405, body: 'Method Not Allowed');
      }
      return innerHandler(request);
    };
  };
}
