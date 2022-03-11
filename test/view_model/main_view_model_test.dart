import 'package:barg_test/core/messages.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/view_model/main_view_model.dart/main_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  init();
  group('Main view model test', () {
    MainViewModel mainViewModel = Get.put(MainViewModel());

    test("The 'usersList' should be fill when 'getUsersList' function execute",
        () async {
      await mainViewModel.getUsersList();
      expect(mainViewModel.usersList.isNotEmpty, true);
    });
    test("The 'ownerUser' should be fill when 'getOwnerUser' function execute",
        () async {
      await mainViewModel.getOwnerUser();
      expect(mainViewModel.ownerUser != null, true);
    });
  });
}
