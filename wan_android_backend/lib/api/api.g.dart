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
    r'/platform/list/<id>/<page>',
    service.fetchPlatformList,
  );
  router.add(
    'GET',
    r'/platform/tabs',
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
    r'/navi/list',
    service.fetchNaviList,
  );
  router.add(
    'GET',
    r'/tree/list',
    service.fetchTreeList,
  );
  router.add(
    'GET',
    r'/tree/detail/list/<id>/<page>',
    service.fetchTreeDetailList,
  );
  router.add(
    'GET',
    r'/hotkey',
    service.fetchHotKeywords,
  );
  return router;
}
