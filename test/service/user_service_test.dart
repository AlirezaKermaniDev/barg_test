import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:barg_test/repository/user_repository/user_repository.dart';
import 'package:barg_test/service/authentication_service/authentication_service.dart';
import 'package:barg_test/service/user_service/user_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  init();

  group('User service test', () {
    UserRepository userService = di<UserRepository>();

    test("The 'getUsersList' function should return list of User Object",
        () async {
      final result = await userService.getUsersList();
      expect(result.isRight(), true);
    });
    test(
        "The 'getUserbyId' function should return failure when pass a wrong id",
        () async {
      final result = await userService.getUserById(
          id: "1h92c941-8865-4970-be9a-09739587d69b");
      expect(result, const Left(UserFailure.invalidUserId()));
    });
    test(
        "The 'getUserbyId' function should return User Object when pass valid Id",
        () async {
      final result = await userService.getUserById(
          id: "1791c941-9939-4970-be9a-09739587d69b");
      expect(result.isRight(), true);
    });
    test("The 'getOwnerUser' function should return User Object", () async {
      final result = await userService.getOwnerUser();
      expect(result.isRight(), true);
    });
  });
}
