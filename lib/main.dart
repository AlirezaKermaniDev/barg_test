import 'package:barg_test/view/login_view/login_view.dart';
import 'package:barg_test/view/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'core/pages.dart';
import 'core/theme.dart';
import 'dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.path,
      theme: themeData,
      getPages: pages,
    ),
  );
}
