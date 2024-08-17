import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:wan_android_backend/db/hive_box.dart';
import 'package:wan_android_backend/route/middleware.dart';
import 'package:wan_android_backend/route/route_handler.dart';
import 'package:wan_android_backend/schedule/schedule.dart';

void main(List<String> args) async {
  print('Server run start.');

  /// 数据库
  HiveBox.init();

  /// 调度
  Schedule().start();

  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(rejectBadRequests())
      .addHandler(RouteHandler().router.call);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  server.autoCompress = true;

  print('Server run success, listening on port ${server.port}');
  print("http://${ip.address}:${server.port}/api/v1/banner");
}
