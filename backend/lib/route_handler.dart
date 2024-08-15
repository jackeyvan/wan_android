import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

class RouteHandler {
  final router = Router()..get('/', _rootHandler);
  // ..mount('/api/v1/films/', FilmApi().router);
}
