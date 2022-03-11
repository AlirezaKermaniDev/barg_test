import 'package:get/get.dart';

import 'login_view_model.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
  }
}
