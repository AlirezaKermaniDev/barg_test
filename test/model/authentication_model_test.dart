import 'package:barg_test/core/assets.dart';
import 'package:barg_test/core/failure/value_failure/value_failure.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/model/friend_model/friend_model.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Authentication models test', () {
    test("Password value object validator test", () {
      // Test invalid password case 1
      Password invalidPasswordCaseOne = Password("123456");
      expect(invalidPasswordCaseOne.value,
          const Left(InvalidPassword<String>(failedValue: "123456")));
      // Test invalid password case 2
      Password invalidPasswordCaseTwo = Password("password");
      expect(invalidPasswordCaseTwo.value,
          const Left(InvalidPassword<String>(failedValue: "password")));

      // Test valid password
      Password validPassword = Password("P@ssw0rd");
      expect(validPassword.value, const Right("P@ssw0rd"));
    });
    test("Email address value object validator test", () {
      // Test invalid email
      EmailAddress invalidEmailAddress = EmailAddress("test@gmail");
      expect(invalidEmailAddress.value,
          const Left(InvalidEmail<String>(failedValue: "123456")));
      // Test valid email
      EmailAddress validEmailAddress = EmailAddress("kermani@gmail.com");
      expect(validEmailAddress.value, const Right("kermani@gmail.com"));
    });
  });
}
