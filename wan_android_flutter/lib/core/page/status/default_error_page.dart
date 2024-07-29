import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String? msg;
  final VoidCallback? onRetry;

  const ErrorPage({super.key, this.msg, this.onRetry});

  @override
  Widget build(BuildContext context) {
    var error = msg ?? "发生错误啦，请重试";
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(error, textAlign: TextAlign.center),
      onRetry == null
          ? const SizedBox.shrink()
          : Column(children: [
              const SizedBox(height: 36),
              ElevatedButton(
                  onPressed: () => onRetry?.call(), child: const Text("重试"))
            ])
    ]));
  }
}
