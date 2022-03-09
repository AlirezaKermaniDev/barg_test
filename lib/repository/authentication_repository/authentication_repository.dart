import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';

abstract class AuthenticationRepository {
  Future<void> logicWithEmailAndPassword({
    required EmailAddress emailAddress,
    required Password password,
  });
}
