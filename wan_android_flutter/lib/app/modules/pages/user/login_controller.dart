import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/api/globe/globe_repository.dart';
import 'package:wan_android/app/api/globe/globe_storage.dart';
import 'package:wan_android/app/const/styles.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/routes/routes.dart';
import 'package:wan_android/core/init/init_core.dart';
import 'package:wan_android/core/net/api_error.dart';
import 'package:wan_android/core/page/base/base_controller.dart';
import 'package:wan_android/core/utils/overlay_utils.dart';

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

  @override
  void onReady() {
    final account = GlobeStorage.readRememberAccount();
    final password = GlobeStorage.readPasswordAccount();

    if (isNotNullOrBlank(account) && isNotNullOrBlank(password)) {
      accountController.text = account!;
      passController.text = password!;
    }
  }

  /// 登录或者注册
  void toLogin() {
    final account = accountController.text;
    final password = passController.text;

    if (isNullOrBlank(account) || isNullOrBlank(password)) {
      OverlayUtils.showToast(Strings.accountOrPasswordIsNull.tr);
      return;
    } else {
      GlobeStorage.writeRememberAccount(account);
      GlobeStorage.writePasswordAccount(password);
    }

    if (isLoginPage) {
      OverlayUtils.showOverlay(
              () => GlobeRepository.login(true, account, password))
          .then((value) => handleResult(value, Strings.loginSuccess.tr))
          .catchError((error, _) => handleError(error));
    } else {
      final rePassword = rePassController.text;

      if (rePassword != password) {
        OverlayUtils.showToast(Strings.twicePasswordDiffer.tr);
        return;
      }

      OverlayUtils.showOverlay(() => GlobeRepository.login(
              false, account, password, rePassword: rePassword))
          .then((value) => handleResult(value, Strings.registerSuccess.tr))
          .catchError((error, _) => handleError(error));
    }
  }

  void handleError(ApiError error) {
    dismissLoadingDialog();
    OverlayUtils.showToast(error.toString());
  }

  void handleResult(User? user, String text) {
    if (user != null) {
      User.saveUser(user);
    }
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
