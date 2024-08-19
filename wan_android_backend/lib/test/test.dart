import 'package:wan_android_backend/db/hive_box.dart';
import 'package:wan_android_backend/repository/repository.dart';

void main() async {
  /// 数据库
  await HiveBox.init();

  Repository.fetchBanner(force: true);

  // get(Uri.parse('http://0.0.0.0:8080/api/v1/banner')).then((result) {
  //   print(result.headers);
  //   print(result.body);
  // });

  // get(Uri.parse('https://www.wanandroid.com/banner/json')).then((result) {
  //   print(result.headers);
  //   print(result.body);
  // });

  // post(Uri.parse('http://0.0.0.0:8080/api/v1/user/login'),
  //         body: jsonEncode({"username": "pgtwo", "password": "123456"}))
  //     .then((result) {
  //   print(result.headers);
  //   print(result.body);
  // });

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
