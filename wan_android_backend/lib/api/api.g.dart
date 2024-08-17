// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// ShelfRouterGenerator
// **************************************************************************

Router _$V1ApiRouter(V1Api service) {
  final router = Router();
  router.add(
    'GET',
    r'/banner',
    service.fetchBanner,
  );
  router.add(
    'GET',
    r'/article/top',
    service.fetchTopArticle,
  );
  router.add(
    'GET',
    r'/article/list/<page>',
    service.fetchHomePageArticle,
  );
  router.add(
    'GET',
    r'/wxarticle/list/<id>/<page>',
    service.fetchPlatformList,
  );
  router.add(
    'GET',
    r'/wxarticle/chapters',
    service.fetchPlatformTabs,
  );
  router.add(
    'GET',
    r'/project/tabs',
    service.fetchProjectTabs,
  );
  router.add(
    'GET',
    r'/project/list/<id>/<page>',
    service.fetchProjectList,
  );
  router.add(
    'GET',
    r'/navi/tabs',
    service.fetchNaviTabs,
  );
  router.add(
    'GET',
    r'/tree/tabs',
    service.fetchTreeTabs,
  );
  router.add(
    'GET',
    r'/tree/list/<id>/<page>',
    service.fetchTreeList,
  );
  router.add(
    'GET',
    r'/hotkey',
    service.fetchHotKeywords,
  );
  return router;
}
