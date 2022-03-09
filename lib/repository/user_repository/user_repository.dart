import 'package:barg_test/core/failure/user_failure/user_failure.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/model/user_model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

abstract class UserRepository {
  Future<Either<UserFailure, List<User>>> getUsersList();
  Future<Either<UserFailure, User>> getOwnerUser();
  Future<Either<UserFailure, User>> getUserById({required String id});
}
