import 'package:barg_test/core/assets.dart';
import 'package:barg_test/core/failure/value_failure/value_failure.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/model/friend_model/friend_model.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test email validator', () {
    test(
        "Email address value should return failure with an email without '.com'",
        () {
      const String testEmail = "test@gmail";
      EmailAddress invalidEmailAddress = EmailAddress(testEmail);
      expect(invalidEmailAddress.value,
          const Left(InvalidEmail<String>(failedValue: testEmail)));
    });
    test("Email address value should return failure with an email without '@'",
        () {
      const String testEmail = "testgmail.com";
      EmailAddress invalidEmailAddress = EmailAddress(testEmail);
      expect(invalidEmailAddress.value,
          const Left(InvalidEmail<String>(failedValue: testEmail)));
    });

    test("Email address value should return value with correct type of Email",
        () {
      const String testEmail = "kermani@gmail.com";
      EmailAddress validEmailAddress = EmailAddress(testEmail);
      expect(validEmailAddress.value, const Right(testEmail));
    });
  });
}
