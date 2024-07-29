import 'dart:async';
import 'dart:math' as math;

import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/entity/user_entity.dart';
import 'package:flutter_wan_android/app/routes/routes.dart';
import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:flutter_wan_android/core/page/base/base_page.dart';
import 'package:flutter_wan_android/core/utils/overlay_utils.dart';
import 'package:get/get.dart';

class DrawerController extends BaseController {
  final user = User.getUser().obs;

  StreamSubscription? subscription;

  String nickName() {
    return isLogin() ? user.value?.username ?? "" : Strings.clickToLogin.tr;
  }

  void nickNameOnTap() {
    if (!isLogin()) Routes.toNamed(Routes.login);
  }

  @override
  void onReady() {
    subscription = User.streamController.stream.listen((user) {
      this.user.value = user;
    });
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }

  /// 退出登录
  void logout(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return OverlayUtils.buildDialog(Strings.logoutConfirm.tr,
              onConfirm: () {
            WanAndroidRepository.logout().then((_) {
              User.clear();
              OverlayUtils.showToast(Strings.logoutSuccess.tr);
              Routes.back();
              user.value = null;
            }).catchError((e, _) {
              OverlayUtils.showToast(Strings.logoutFailure.tr);
            });
          });
        });
  }

  bool isLogin() => user.value != null;
}

class DrawerPage extends BasePage<DrawerController> {
  static const _imgHeight = 96.0;
  static const _expandedHeight = 120.0;

  const DrawerPage({super.key});

  @override
  void dependencies() {
    Get.lazyPut(() => DrawerController());
  }

  @override
  Widget buildPage(BuildContext context) {
    final themeData = Theme.of(context);
    return Stack(children: [
      EasyRefresh(
        header: buildRefreshHeader(themeData),
        onRefresh: () {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: themeData.colorScheme.primary,
              foregroundColor: themeData.colorScheme.onPrimary,
              expandedHeight: _expandedHeight,
              pinned: true,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Obx(() => GestureDetector(
                    onTap: () => controller.nickNameOnTap(),
                    child: Text(
                      controller.nickName(),
                      style: TextStyle(color: themeData.colorScheme.onPrimary),
                    ))),
                centerTitle: true,
                titlePadding: const EdgeInsets.only(bottom: 18),
              ),
            ),
            const HeaderLocator.sliver(paintExtent: 80),
            SliverToBoxAdapter(
              child: Card(
                // elevation: 0,
                margin: const EdgeInsets.only(top: 48, left: 16, right: 16),
                color: themeData.colorScheme.primaryContainer,
                // clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.color_lens_outlined),
                      title: Text(Strings.theme.tr),
                      onTap: () => Routes.toNamed(Routes.themeChose),
                    ),
                    ListTile(
                      leading: const Icon(Icons.language_outlined),
                      title: Text(Strings.language.tr),
                      onTap: () => Routes.toNamed(Routes.language),
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout_outlined),
                      title: Text(Strings.logout.tr),
                      onTap: () => Routes.toNamed(Routes.language),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Obx(() => controller.isLogin()
          ? Positioned(
              bottom: 24,
              right: 18,
              child: TextButton.icon(
                onPressed: () => controller.logout(context),
                icon: const Icon(Icons.logout_outlined),
                label: Text(Strings.logout.tr),
              ))
          : const SizedBox.shrink())
    ]);
  }

  BuilderHeader buildRefreshHeader(ThemeData themeData) {
    return BuilderHeader(
      clamping: false,
      position: IndicatorPosition.locator,
      triggerOffset: 100000,
      notifyWhenInvisible: true,
      builder: (context, state) {
        const expandedExtent = _expandedHeight - kToolbarHeight;
        final pixels = state.notifier.position.pixels;
        final height = state.offset + _imgHeight;
        final clipEndHeight = pixels < expandedExtent
            ? _imgHeight
            : math.max(0.0, _imgHeight - pixels + expandedExtent);
        final imgHeight = pixels < expandedExtent
            ? _imgHeight
            : math.max(0.0, _imgHeight - (pixels - expandedExtent));
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: _TrapezoidClipper(
                height: height,
                clipStartHeight: 0.0,
                clipEndHeight: clipEndHeight,
              ),
              child: Container(
                height: height,
                width: double.infinity,
                color: themeData.colorScheme.primary,
              ),
            ),
            Positioned(
              top: -1,
              left: 0,
              right: 0,
              child: ClipPath(
                clipper: _FillLineClipper(imgHeight),
                child: Container(
                  height: 2,
                  width: double.infinity,
                  color: themeData.colorScheme.primary,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipOval(
                child: Image.asset(
                  "assets/icons/launcher_icon.png",
                  height: imgHeight,
                  width: imgHeight,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TrapezoidClipper extends CustomClipper<Path> {
  final double height;
  final double clipStartHeight;
  final double clipEndHeight;

  _TrapezoidClipper({
    required this.height,
    required this.clipStartHeight,
    required this.clipEndHeight,
  });

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height - clipEndHeight);
    path.lineTo(0, height - clipStartHeight);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(_TrapezoidClipper oldClipper) {
    return oldClipper.height != height ||
        oldClipper.clipStartHeight != clipStartHeight ||
        oldClipper.clipEndHeight != clipEndHeight;
  }
}

class _FillLineClipper extends CustomClipper<Path> {
  final double imgHeight;

  _FillLineClipper(this.imgHeight);

  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(width, 0);
    path.lineTo(width, height / 2);
    path.lineTo(0, height / 2 + imgHeight / 2);
    path.lineTo(0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _FillLineClipper oldClipper) {
    return oldClipper.imgHeight != imgHeight;
  }
}
