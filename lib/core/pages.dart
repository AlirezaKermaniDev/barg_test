import 'package:barg_test/view/login_view/login_view.dart';
import 'package:barg_test/view/main_view/main_view.dart';
import 'package:barg_test/view_model/login_view_model.dart/login_binding.dart';
import 'package:barg_test/view_model/main_view_model.dart/main_binding.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
      name: LoginView.path,
      page: () => const LoginView(),
      binding: LoginBinding()),
  GetPage(
      transition: Transition.downToUp,
      transitionDuration: const Duration(seconds: 1),
      name: MainView.path,
      page: () => const MainView(),
      binding: MainBinding()),
];
