import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:dartz/dartz.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

abstract class AuthenticationRepository {
  Future<Either<AuthenticationFailure, bool>> logicWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
}
