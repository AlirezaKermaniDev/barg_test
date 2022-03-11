import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

class Messages {
  static const String invalidEmail = "Invalid email address";
  static const String invalidPassword =
      "Password must contains :\n-At least 8 Characters\n-Minimum 1 Upper case\n-Minimum 1 lowercase\n-Minimum 1 Numeric Number\n-Minimum 1 Special Character ( ! @ # \$ & * ~) ";
  static const String wrongPasswordOrEmail =
      "Email address or password is incorrect";

  static Map<AuthenticationFailure, String> authenticationFailureToMessage = {
    const AuthenticationFailure.wrongPasswordOrEmail(): wrongPasswordOrEmail
  };
}
