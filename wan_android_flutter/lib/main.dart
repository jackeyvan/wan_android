import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/const/lang.dart';
import 'package:wan_android/app/routes/binding.dart';
import 'package:wan_android/app/routes/routes.dart';
import 'package:wan_android/core/init/themes.dart';

import 'app/service/app_service.dart';

void main() async {
  /// run app before init dependencies and some config.
  await AppService().dependencies();

  runApp(const WanApp());
}

class WanApp extends StatelessWidget {
  const WanApp({super.key});

  static const _mobileWidthThreshold = 500;
  static const _mobileWidth = 420.0;
  static const _mobileHeight = 900.0;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.root,
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      translations: Languages(),
      locale: Languages.locale,
      fallbackLocale: Languages.fallbackLocale,
      builder: (context, widget) => _buildFrame(context, widget!),
    );
  }

  /// 在Web上展示Mobile的样式
  Widget _buildFrame(BuildContext context, Widget widget) {
    if (GetPlatform.isWeb) {
      final window = View.of(context);
      final size = window.physicalSize / window.devicePixelRatio;
      final hasFrame = size.width > _mobileWidthThreshold;
      if (hasFrame) {
        return Builder(builder: (context) {
          return Scaffold(
              backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
              body: Center(
                child: Card(
                  elevation: 10,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  clipBehavior: Clip.hardEdge,
                  child: SizedBox(
                    height: _mobileHeight,
                    width: _mobileWidth,
                    child: widget,
                  ),
                ),
              ));
        });
      }
    }
    return widget;
  }
}
