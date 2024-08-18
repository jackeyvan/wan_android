import 'dart:convert';

import 'package:http/http.dart';

void main() {
  post(Uri.parse('http://0.0.0.0:8080/api/v1/user/login'),
          body: jsonEncode({"username": "pgtwo", "password": "123456"}))
      .then((result) {
    print(result.headers);
    print(result.body);
  });

  // post(Uri.parse('http://0.0.0.0:8080/api/v1/user/register'),
  //     body: jsonEncode({
  //       "username": "pgtwo",
  //       "password": "123456",
  //       "rePassword": "123456"
  //     })).then((result) {
  //   print(result.body);
  // });

  // post(Uri.parse('http://0.0.0.0:8080/api/v1/search/0'),
  //     body: jsonEncode({"query": "Android"})).then((result) {
  //   print(result.body);
  // });
}
