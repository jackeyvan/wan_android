import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/api/wan_android_repository.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/routes/routes.dart';
import 'package:flutter_wan_android/core/init/init_core.dart';
import 'package:flutter_wan_android/core/net/api_error.dart';
import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:flutter_wan_android/core/utils/overlay_utils.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class LoginController extends BaseController {
  /// 默认是登录页面
  final _isLoginPage = true.obs;

  bool get isLoginPage => _isLoginPage.value;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final TextEditingController rePassController = TextEditingController();

  String get loginText => isLoginPage ? Strings.login.tr : Strings.register.tr;

  String get toLoginTips =>
      isLoginPage ? Strings.donHaveAccount.tr : Strings.haveAccount.tr;

  String get toLoginButtonTips =>
      isLoginPage ? Strings.register.tr : Strings.login.tr;

  /// 登录或者注册
  void toLogin() {
    final account = accountController.text;
    final password = passController.text;

    if (isNullOrBlank(account) || isNullOrBlank(password)) {
      OverlayUtils.showToast(Strings.accountOrPasswordIsNull.tr);
      return;
    }

    if (isLoginPage) {
      OverlayUtils.showOverlay(
              () => WanAndroidRepository.login(true, account, password))
          .then((value) => offPage(Strings.loginSuccess.tr))
          .catchError((error, _) => handleError(error));
    } else {
      final rePassword = rePassController.text;

      if (rePassword != password) {
        OverlayUtils.showToast(Strings.twicePasswordDiffer.tr);
        return;
      }

      OverlayUtils.showOverlay(() => WanAndroidRepository.login(
              false, account, password, rePassword: rePassword))
          .then((e) => offPage(Strings.registerSuccess.tr))
          .catchError((error, _) => handleError(error));
    }
  }

  void handleError(ApiError error) {
    dismissLoadingDialog();
    OverlayUtils.showToast(error.toString());
  }

  void offPage(String text) {
    dismissLoadingDialog();
    OverlayUtils.showToast(text);
    Routes.back();
  }

  changeToRegisterPage() {
    _isLoginPage.value = !isLoginPage;
    update();
  }

  Widget bgImg() {
    final url = isLoginPage
        ? "assets/images/login_bg.png"
        : "assets/images/register_bg.png";
    return Image.asset(url, fit: BoxFit.cover);
  }
}
