import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/api/api.dart';

const _defaultHeadersList = [
  'Accept',
  'Accept-Encoding',
  'Authorization',
  'Content-Type',
  'Dnt',
  'Origin',
  'X-Requested-With',
  'User-Agent',
];

const _defaultMethodsList = [
  'DELETE',
  'GET',
  'OPTIONS',
  'PATCH',
  'POST',
  'PUT'
];

final defaultResponseHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Credentials': 'true',
  'Access-Control-Allow-Headers': _defaultHeadersList.join(','),
  'Access-Control-Allow-Methods': _defaultMethodsList.join(','),
  'Access-Control-Max-Age': '86400',
  'Content-Type': 'application/json;charset=utf-8',
};

class RouteHandler {
  Response _rootHandler(Request req) {
    return Response.ok('Hello, World!\n');
  }

  /// Api Route
  Router get _apiRouter {
    final apiRouter = Router();

    apiRouter.mount("/v1", V1Api().router.call);

    return apiRouter;
  }

  Router get router {
    final router = Router();

    router.get("/", _rootHandler);
    router.mount("/api", _apiRouter.call);

    return router;
  }
}
