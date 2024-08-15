// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'film_api.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$FilmApiRouter(FilmApi service) {
  final router = Router();
  router.add(
    'GET',
    r'/',
    service.fetchFilms,
  );
  router.add(
    'GET',
    r'/<id|[0-9]+>',
    service.fetchFilmById,
  );
  return router;
}
