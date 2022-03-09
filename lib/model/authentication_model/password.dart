import 'package:barg_test/core/failure/value_failure/value_failure.dart';
import 'package:barg_test/core/value_object.dart';
import 'package:dartz/dartz.dart';
import 'package:email_validator/email_validator.dart';

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  factory Password(String password) {
    return Password._(validatePassword(password));
  }
  const Password._(this.value);

  static Either<ValueFailure<String>, String> validatePassword(
      String password) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);

    if (regExp.hasMatch(password)) {
      return Right(password);
    } else {
      return Left(ValueFailure.invalidPassword(failedValue: password));
    }
  }
}
