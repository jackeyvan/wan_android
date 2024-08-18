import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/globe_repository.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/app/modules/widget/article_item_widget.dart';
import 'package:wan_android/core/page/refresh/refresh_controller.dart';
import 'package:wan_android/core/page/refresh/refresh_page.dart';

class SearchResultPage extends GetRefreshPage<SearchResultController> {
  final String query;

  const SearchResultPage(this.query, {super.key});

  @override
  String? get tag => query;

  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController(query), tag: query);
    GlobeStorage.writeSearchHistory(query);
  }

  @override
  Widget buildPage(BuildContext context) {
    return buildObxRefreshListPage<ArticleEntity>(
        itemBuilder: (data, index) => ArticleItemWidget(data));
  }
}

class SearchResultController extends GetRefreshListController<ArticleEntity> {
  final String query;

  SearchResultController(this.query);

  @override
  Future<List<ArticleEntity>> loadListData(int page, bool isRefresh) {
    return GlobeRepository.fetchSearchResult(query, page);
  }
}
