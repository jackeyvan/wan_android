import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/modules/entity/article_entity.dart';
import 'package:flutter_wan_android/app/modules/widget/article_item_widget.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_controller.dart';
import 'package:flutter_wan_android/core/page/refresh/refresh_page.dart';
import 'package:get/get.dart';

class SearchResultPage extends GetRefreshPage<SearchResultController> {
  final String query;

  const SearchResultPage(this.query, {super.key});

  @override
  String? get tag => query;

  @override
  void dependencies() {
    Get.lazyPut(() => SearchResultController(query), tag: query);
    WanAndroidStorage.writeSearchHistory(query);
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
    return WanAndroidRepository.fetchSearchResult(query, page);
  }
}
