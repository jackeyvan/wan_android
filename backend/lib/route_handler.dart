import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'api/banner.dart';

class RouteHandler {
  Response _rootHandler(Request req) {
    return Response.ok('Hello, World!\n');
  }

  /// Api Route
  Router get _apiRouter {
    final apiRouter = Router();

    apiRouter.mount("/v1/banner", BannerApi().router.call);

    return apiRouter;
  }

  Router get router {
    final router = Router();

    router.get("/", _rootHandler);
    router.mount("/api", _apiRouter.call);

    return router;
  }
}
