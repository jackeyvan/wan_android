import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android/app/modules/entity/user_entity.dart';
import 'package:wan_android/app/routes/routes.dart';

class LoginMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (User.isLogin()) {
      return super.redirect(route);
    } else {
      return const RouteSettings(name: Routes.login);
    }
  }
}
