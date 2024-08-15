import 'package:shelf/shelf_io.dart' as io;
import 'package:wan_android_backend/api_handler.dart';

void main(List<String> arguments) async {
  await io.serve(ApiHandler().handler, 'localhost', 8080);
}
