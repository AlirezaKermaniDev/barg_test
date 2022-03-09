import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';
import 'package:barg_test/repository/authentication_repository/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationService implements AuthenticationRepository {
  @override
  Future<Either<AuthenticationFailure, bool>> logicWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (emailAddress.getDataOrCrash() == "kermani@gmail.com" &&
        password.getDataOrCrash() == "P@ssw0rd") {
      return const Right(true);
    } else {
      return const Left(AuthenticationFailure.wrongPasswordOrEmail());
    }
  }
}
