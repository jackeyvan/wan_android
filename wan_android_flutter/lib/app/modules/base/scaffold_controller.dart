import 'package:flutter_wan_android/core/page/base/base_controller.dart';
import 'package:get/get.dart';

abstract class ScaffoldController<T> extends BaseController<T> {
  final _title = "".obs;

  String get title => _title.value;

  set title(String title) => _title.value = title;
}
