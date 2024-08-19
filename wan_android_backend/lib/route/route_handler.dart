import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:wan_android_backend/api/api.dart';

class RouteHandler {
  Response _rootHandler(Request req) {
    return Response.ok('Dart server run success.');
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
