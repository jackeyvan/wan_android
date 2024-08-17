import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan_android/app/api/wan_android_repository.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/base/scaffold_controller.dart';
import 'package:wan_android/app/modules/entity/article_entity.dart';
import 'package:wan_android/core/init/init_core.dart';
import 'package:wan_android/core/utils/log_utils.dart';
import 'package:wan_android/core/utils/overlay_utils.dart';

class ArticleDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleDetailController());
  }
}

/// 文章详情，暂时没有设置背景颜色的API
class ArticleDetailController extends ScaffoldController<ArticleEntity> {
  InAppWebViewController? _webViewController;

  final isCollected = false.obs;

  final _progress = 0.0.obs;

  double get progress => _progress.value;

  String webUrl = "";

  set progress(double progress) => _progress.value = progress;

  final InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: LogUtils.enableLog,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllowFullscreen: true);

  @override
  void onReady() {
    super.onReady();
    var args = Get.arguments;
    if (args != null && args is ArticleEntity) {
      title = Strings.escape(args.title ?? "");
      data = args;
      webUrl = args.link ?? "";

      final id = (data?.id ?? 0).toString();
      final result = WanAndroidStorage.readCollect(id);
      if (isNotNullOrBlank(result)) {
        isCollected.value = true;
      }

      showSuccessPage();
    } else {
      showEmptyPage();
    }
  }

  void reload() {
    _webViewController?.reload();
    showSuccessPage();
  }

  Future<void> launchInBrowser() async {
    final url = Uri.parse(data?.link ?? "");
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchInBrowserView() async {
    final url = Uri.parse(data?.link ?? "");

    if (!await launchUrl(url, mode: LaunchMode.inAppBrowserView)) {
      throw Exception('Could not launch $url');
    }
  }

  /// WebView Controller创建
  void controllerCreate(InAppWebViewController controller) {
    _webViewController = controller;
  }

  /// 收藏网址或者取消收藏
  void favorite() {
    final id = (data?.id ?? 0).toString();

    if (isCollected.value) {
      /// 取消收藏
      WanAndroidRepository.cancelCollectArticle(id).then((value) {
        WanAndroidStorage.removeCollect(id);
        OverlayUtils.showToast("取消收藏成功");
      }).catchError((e, s) => OverlayUtils.showToast("取消收藏失败"));
    } else {
      /// 收藏网址
      WanAndroidRepository.postCollectArticle(id).then((value) {
        WanAndroidStorage.saveCollect(id, id);
        OverlayUtils.showToast("收藏成功");
      }).catchError((e, s) => OverlayUtils.showToast("收藏失败"));
    }

    /// 先改变状态
    isCollected.value = !isCollected.value;
  }
}
