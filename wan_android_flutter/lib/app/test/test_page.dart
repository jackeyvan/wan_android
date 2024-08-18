import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan_android/app/api/globe/globe_repository.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String url = 'https://wan-android-backend-duywngg-jackeyvan.globeapp.dev/';
  String loginUrl = 'http://0.0.0.0:8081/api/v1/user/login';

  Future<Response>? future;

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("测试页面")),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            ElevatedButton(onPressed: () => click(), child: const Text("请求")),
            const SizedBox(height: 12),
            FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else {
                    if (snapshot.hasData) {
                      return Text(snapshot.data?.toString() ?? "暂无数据");
                    }
                    return const SizedBox.shrink();
                  }
                }),
          ]),
        ));
  }

  click() {
    GlobeRepository.login(true, "pgtwo", "123456");

    // http
    //     .post(Uri.parse(loginUrl),
    //         body: jsonEncode({"username": "pgtwo", "password": "123456"}))
    //     .then((value) {
    //   print("http header: ${value.headers}");
    // });
  }
}
