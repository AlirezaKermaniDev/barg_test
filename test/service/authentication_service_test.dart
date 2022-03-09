import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/service/authentication_service/authentication_service.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

void main() {
  group('Autentication service test', () {
    AuthenticationService authenticationService = AuthenticationService();

    test(
        "Autentication service should return failure with wrong password and email",
        () async {
      final result = await authenticationService.loginWithEmailAndPassword(
          emailAddress: EmailAddress("test@gmail.com"),
          password: Password("@liReza12345"));
      expect(result, const Left(AuthenticationFailure.wrongPasswordOrEmail()));
    });
    test(
        "Autentication service should return true with correct password and email",
        () async {
      final result = await authenticationService.loginWithEmailAndPassword(
          emailAddress: EmailAddress("kermani@gmail.com"),
          password: Password("P@ssw0rd"));
      expect(result, const Right(true));
    });
  });
}
