import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/globe_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/hot_key_entity.dart';
import 'package:wan_android/core/page/base/base_controller.dart';
import 'package:wan_android/core/utils/overlay_utils.dart';

import 'search_delegate_page.dart';

class SearchSuggestionsPage extends StatelessWidget {
  final SearchBarDelegate delegate;

  const SearchSuggestionsPage(this.delegate, {super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: constraints.maxHeight, minWidth: constraints.maxWidth),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                buildSuggestionsItem(context, true),
                buildSuggestionsItem(context, false),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildSuggestionsItem(BuildContext context, bool isHotkey) {
    return GetBuilder(
        init: SearchSuggestionsController(),
        builder: (controller) {
          final data =
              isHotkey ? controller.hotKeyData : controller.historyData;

          if (data.isEmpty) return const SizedBox.shrink();

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                      isHotkey
                          ? Strings.hotSearch.tr
                          : Strings.historySearch.tr,
                      style: const TextStyle(fontSize: 16)),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: () {
                      if (isHotkey) {
                        controller.retryHotkeys();
                      } else {
                        controller.clearHistory();
                      }
                    },
                    label:
                        Text(isHotkey ? Strings.change.tr : Strings.clear.tr),
                    icon: Icon(isHotkey ? Icons.refresh : Icons.clear),
                  )
                ]),
                Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 6,
                  runSpacing: 2,
                  children: data
                      .map((e) => OutlinedButton(
                          onPressed: () {
                            delegate.query = e;
                            delegate.showResults(context);
                          },
                          child: Text(e)))
                      .toList(),
                )
              ]);
        });
  }
}

class SearchSuggestionsController extends BaseController {
  List<String> hotKeyData = [];
  List<String> historyData = [];

  @override
  void onReady() {
    fetchHotKeywords().then((e) {
      if (e != null && e.isNotEmpty) {
        hotKeyData = e.map((data) => data.name ?? "").toList();
      }

      historyData = readSearchHistory();
      update();
    });
  }

  Future<List<HotKeyEntity>?> fetchHotKeywords() =>
      GlobeRepository.fetchHotKeywords();

  List<String> readSearchHistory() => GlobeStorage.readSearchHistory();

  void clearHistory() {
    historyData.clear();
    update();
    GlobeStorage.clearSearchHistory();
    OverlayUtils.showToast(Strings.clearSuccess.tr);
  }

  void retryHotkeys() {
    /// 随机排序hotKeyData数据
    hotKeyData.shuffle();
    update();
  }
}
