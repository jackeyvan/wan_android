import 'package:flutter/material.dart';
import 'package:flutter_wan_android/app/routes/routes.dart';
import 'package:flutter_wan_android/core/init/init_core.dart';
import 'package:fluttertoast/fluttertoast.dart' as f_toast;
import 'package:get/get.dart';

/// 封装顶级弹窗工具类
class OverlayUtils {
  /// 普通的提示对话框
  static AlertDialog buildDialog(
    String content, {
    String? title,
    String? cancel,
    String? confirm,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return AlertDialog(
      title: Text(title ?? '温馨提示'),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          child: Text(cancel ?? '取消'),
          onPressed: () {
            onCancel != null
                ? onCancel.call()
                : Routes.back(); // Dismiss alert dialog
          },
        ),
        TextButton(
          child: Text(confirm ?? '确认'),
          onPressed: () {
            onConfirm != null
                ? onConfirm.call()
                : Routes.back(); // Dismiss alert dialog
          },
        ),
      ],
    );
  }

  /// 展示加载弹窗
  static Future<T> showOverlay<T>(Future<T> Function() onLoad) {
    return Get.showOverlay(
        loadingWidget: const Material(
            color: Colors.transparent,
            child: Center(
                child: Card(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 36),
                  child: Wrap(
                    direction: Axis.vertical,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 16),
                      Text("加载中")
                    ],
                  )),
            ))),
        asyncFunction: onLoad);
  }

  /// 吐司
  static showToast(String? msg) {
    if (isNotNullOrBlank(msg)) {
      f_toast.Fluttertoast.showToast(
          msg: msg!,
          timeInSecForIosWeb: 1,
          toastLength: f_toast.Toast.LENGTH_SHORT,
          gravity: f_toast.ToastGravity.CENTER,
          fontSize: 16.0);
    }
  }

  /// SnackBar
  static showSnackBar(String? msg) {
    if (isNotNullOrBlank(msg)) {
      Get.showSnackbar(GetSnackBar(title: msg));
    }
  }
}
