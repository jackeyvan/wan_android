import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/const/styles.dart';
import 'package:flutter_wan_android/app/modules/pages/user/login_controller.dart';
import 'package:flutter_wan_android/core/init/themes.dart';
import 'package:flutter_wan_android/core/page/base/base_page.dart';
import 'package:get/get.dart';

class LoginPage extends BasePage<LoginController> {
  const LoginPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (c) => NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: SliverAppBar(
                      leading: const BackButton(),
                      pinned: true,
                      expandedHeight: 240,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Obx(() => controller.bgImg()),
                      ),
                      forceElevated: innerBoxIsScrolled,
                    ),
                  ),
                ];
              },
              body: Builder(builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.all(48),
                  child: CustomScrollView(
                    slivers: [
                      SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context)),
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Wrap(
                            children: [
                              buildLoginText(controller.loginText),

                              buildTextField(controller.accountController,
                                  Strings.account.tr),

                              buildTextField(controller.passController,
                                  Strings.password.tr),

                              /// 重复密码
                              buildTextField(controller.rePassController,
                                  Strings.rePassword.tr,
                                  visible: controller.isLoginPage),

                              /// 登录注册按钮
                              buildLoginButton(controller.loginText),

                              buildToLoginOrRegisterText(),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                );
              }),
            ));
  }

  /// 登录注册文字大标题
  buildLoginText(String text) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Text(text,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)));
  }

  /// 输入框
  buildTextField(TextEditingController controller, String labelText,
      {bool visible = false}) {
    return Offstage(
      offstage: visible,
      child: Padding(
          padding: const EdgeInsets.only(top: 18),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              labelText: labelText,
              enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 1)),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(width: 1),
              ),
            ),
          )),
    );
  }

  /// 登录注册按钮
  buildLoginButton(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      child: SizedBox(
        height: 56,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => controller.toLogin(),
          child: Text(text,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  /// 去注册文字
  buildToLoginOrRegisterText() {
    return Row(
      children: [
        Text(controller.toLoginTips),
        InkWell(
          onTap: () => controller.changeToRegisterPage(),
          child: Text(controller.toLoginButtonTips,
              style: TextStyle(color: AppTheme.primary())),
        ),
      ],
    );
  }
}
