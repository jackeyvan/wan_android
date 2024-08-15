import 'package:flutter/material.dart';

// final client = Client('http://localhost:8080/')
//   ..connectivityMonitor = FlutterConnectivityMonitor();

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("测试页面")),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            ElevatedButton(
                onPressed: () => _loadData(), child: const Text("请求")),
            const SizedBox(height: 12),
            Text(result),
          ]),
        ));
  }

  _loadData() {
    // client.banner.insertBanner().then((banner) {
    //   setState(() {
    //     result = banner.data?.toString() ?? "暂无数据";
    //   });
    // });
  }
}
