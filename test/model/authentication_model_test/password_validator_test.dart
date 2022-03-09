import 'package:barg_test/core/failure/value_failure/value_failure.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Password validator', () {
    test("Password should return failure with only numbers", () {
      const String testPassword = "12345";
      Password invalidPassword = Password(testPassword);
      expect(invalidPassword.value,
          const Left(InvalidPassword<String>(failedValue: testPassword)));
    });
    test("Password should return failure with only Lowercase characters", () {
      const String testPassword = "kermani";
      Password invalidPassword = Password(testPassword);
      expect(invalidPassword.value,
          const Left(InvalidPassword<String>(failedValue: testPassword)));
    });
    test("Password should return failure without least one Upercase character",
        () {
      const String testPassword = "kermani12345";
      Password invalidPassword = Password(testPassword);
      expect(invalidPassword.value,
          const Left(InvalidPassword<String>(failedValue: testPassword)));
    });

    test("Password should return failure without least one Special character",
        () {
      const String testPassword = "Kermani12345";
      Password invalidPassword = Password(testPassword);
      expect(invalidPassword.value,
          const Left(InvalidPassword<String>(failedValue: testPassword)));
    });
    test("Password should return value with correct type and character", () {
      const String testPassword = "P@ssw0rd";

      Password validPassword = Password(testPassword);
      expect(validPassword.value, const Right(testPassword));
    });
  });
}
