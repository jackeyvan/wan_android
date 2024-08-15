import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'film_api.dart';

class ApiHandler {
  Handler get handler {
    final router = Router();

    router.mount('/films/', FilmApi().router);

    router.get('/', (Request request) {
      return Response.ok('Hello Flutter Backend!');
    });

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return const Pipeline()
        .addMiddleware(logRequests())
        .addHandler(router.call);
  }
}
