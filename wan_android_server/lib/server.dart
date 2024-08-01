import 'package:http/http.dart' as http;
import 'package:serverpod/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:wan_android_server/src/web/routes/root.dart';

import 'src/future_calls/wan_android_schedule.dart';
import 'src/generated/endpoints.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

final httpClient = http.Client();

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
  );

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Setup a default page at the web root.
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');
  // Serve all files in the /static directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  schedule(pod);

  // Start the server.
  await pod.start();
}

///  定时调度
void schedule(Serverpod pod) {
  final scheduleName = "wan_android_schedule";

  futureCall() =>
      pod.futureCallWithDelay(scheduleName, null, Duration(seconds: 5));

  /// 注册
  pod.registerFutureCall(WanAndroidSchedule(), scheduleName);

  /// 启动服务后立马调用一次
  futureCall();

  Stream.periodic(Duration(minutes: 10)).listen((e) => futureCall());
}
