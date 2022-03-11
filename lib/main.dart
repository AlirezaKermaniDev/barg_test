import 'package:barg_test/view/login_view/login_view.dart';
import 'package:barg_test/view_model/login_view_model.dart/login_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/pages.dart';
import 'core/theme.dart';
import 'dependency_injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
