import 'dart:io';

import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:wan_android_backend/middleware.dart';
import 'package:wan_android_backend/route_handler.dart';

void main(List<String> args) async {
  print('Server run start.');

  final ip = InternetAddress.anyIPv4;

  final handler = Pipeline()
      .addMiddleware(logRequests())
      .addMiddleware(rejectBadRequests())
      .addHandler(RouteHandler().router);

  final port = int.parse(Platform.environment['PORT'] ?? '8080');
  final server = await serve(handler, ip, port);
  server.autoCompress = true;

  print('Server run success, listening on port ${server.port}');
  print("http://${ip.address}:${server.port}");
}
