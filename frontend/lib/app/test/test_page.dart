import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String url = 'http://127.0.0.1:8080/api/v1/films/';

  Future<Response>? future;

  final dio = Dio();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("测试页面")),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            ElevatedButton(
                onPressed: () => future = dio.get(url).then((value) {
                      print(value.data);

                      return value;
                    }),
                child: const Text("请求")),
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
}
