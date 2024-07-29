import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wan_android/app/modules/base/scaffold_page.dart';
import 'package:flutter_wan_android/app/modules/pages/article/article_detail_controller.dart';
import 'package:get/get.dart';

class ArticleDetailPage extends ScaffoldPage<ArticleDetailController> {
  const ArticleDetailPage({super.key});

  @override
  Widget buildBodyPage() {
    return buildObx(
        builder: () => Stack(children: [
              InAppWebView(
                gestureRecognizers: {}..add(
                    Factory<VerticalDragGestureRecognizer>(
                        () => VerticalDragGestureRecognizer())),
                initialSettings: controller.settings,
                initialUrlRequest: URLRequest(url: WebUri(controller.webUrl)),
                keepAlive: InAppWebViewKeepAlive(),
                onWebViewCreated: (c) => controller.controllerCreate(c),
                onProgressChanged: (controller, progress) =>
                    this.controller.progress = progress.toDouble(),
                onReceivedError: (c, r, error) =>
                    controller.showErrorPage(error.description),
                onReceivedHttpError: (c, r, error) =>
                    controller.showErrorPage(error.toString()),
              ),
              Obx(
                () => Offstage(
                    offstage: controller.progress == 100,
                    child: LinearProgressIndicator(
                        minHeight: 2, value: (controller.progress / 100))),
              ),
            ]));
  }

  @override
  List<Widget>? buildActions() {
    return [
      IconButton(
          onPressed: () => controller.reload(),
          icon: const Icon(Icons.refresh)),
      IconButton(
          onPressed: () => controller.launchInBrowserView(),
          icon: const Icon(Icons.open_in_browser_outlined)),
      IconButton(
          onPressed: () => controller.copyUrl(),
          icon: const Icon(Icons.copy_all_outlined)),
    ];
  }
}
