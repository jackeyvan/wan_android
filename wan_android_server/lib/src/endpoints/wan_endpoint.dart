import 'package:serverpod/serverpod.dart';

class WanEndpoint extends Endpoint {
  Future<String> helloWorld(Session session, String name) async {
    return 'Hello World ---> $name';
  }
}
