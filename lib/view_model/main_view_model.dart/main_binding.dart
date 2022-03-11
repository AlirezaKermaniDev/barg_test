import 'package:get/get.dart';

import 'main_view_model.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainViewModel());
  }
}
