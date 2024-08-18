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
    r'/point/rank/<page>',
    service.fetchPointRank,
  );
  router.add(
    'GET',
    r'/hotkey',
    service.fetchHotKeywords,
  );
  router.add(
    'POST',
    r'/search/<page>',
    service.fetchSearchResult,
  );
  router.add(
    'POST',
    r'/user/login',
    service.login,
  );
  router.add(
    'GET',
    r'/user/logout',
    service.logout,
  );
  router.add(
    'POST',
    r'/user/register',
    service.register,
  );
  router.add(
    'GET',
    r'/user/points/<page>',
    service.fetchCoinList,
  );
  router.add(
    'GET',
    r'/user/info',
    service.fetchUserInfo,
  );
  router.add(
    'GET',
    r'/user/collect/list/<page>',
    service.fetchUserCollection,
  );
  router.add(
    'GET',
    r'/user/collect/<id>',
    service.collectArticle,
  );
  router.add(
    'GET',
    r'/user/un_collect/<id>',
    service.unCollectArticle,
  );
  return router;
}
