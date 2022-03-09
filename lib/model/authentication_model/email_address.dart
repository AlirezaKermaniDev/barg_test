import 'package:barg_test/core/failure/value_failure/value_failure.dart';
import 'package:barg_test/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory EmailAddress(String email) {
    return EmailAddress._(validateEmailAddress(email));
  }
  const EmailAddress._(this.value);

  static Either<ValueFailure<String>, String> validateEmailAddress(
      String email) {
    if (EmailValidator.validate(email)) {
      return Right(email);
    } else {
      return Left(ValueFailure.invalidEmail(failedValue: email));
    }
  }
}