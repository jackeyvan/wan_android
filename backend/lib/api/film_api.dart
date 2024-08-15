import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'film_api.g.dart';

class FilmApi {
  final List data = json.decode(File('films.json').readAsStringSync());

  @Route.get('/')
  Future<Response> fetchFilms(Request request) async {
    return Response.ok(json.encode(data),
        headers: {'Content-Type': 'application/json'});
  }

  @Route.get('/<id|[0-9]+>')
  Future<Response> fetchFilmById(Request request, String id) async {
    final parsedId = int.tryParse(id);
    final film =
        data.firstWhere((film) => film['id'] == parsedId, orElse: () => null);

    if (film != null) {
      return Response.ok(json.encode(film),
          headers: {'Content-Type': 'application/json'});
    }

    return Response.notFound('Film not found.');
  }

  Router get router => _$FilmApiRouter(this);
}
