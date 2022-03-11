import 'package:barg_test/view/login_view/login_view.dart';
import 'package:barg_test/view/main_view/main_view.dart';
import 'package:barg_test/view/profile_view/profile_view.dart';
import 'package:get/get.dart';

List<GetPage> pages = [
  GetPage(
      name: LoginView.path,
      page: () => LoginView()),
  GetPage(
      name: MainView.path,
      page: () =>  MainView()),
  GetPage(
      name: ProfileView.path,
      page: () =>  ProfileView()),
];
