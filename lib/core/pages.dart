import 'package:barg_test/view/login_view/login_view.dart';
import 'package:barg_test/view_model/login_view_model.dart/login_binding.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
      name: LoginView.path,
      page: () => const LoginView(),
      binding: LoginBinding()),
];
