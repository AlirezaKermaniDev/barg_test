import 'package:barg_test/core/messages.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/view_model/login_view_model/login_view_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  init();
  group('Login view model test', () {
    LoginViewModel loginViewModel = Get.put(LoginViewModel());

    test(
        "The 'isLogging' value should change when 'changeIsLoggingStatus' function execute",
        () async {
      loginViewModel.changeIsLoggingStatus(true);

      expect(loginViewModel.isLogging, true);

      loginViewModel.changeIsLoggingStatus(false);

      expect(loginViewModel.isLogging, false);
    });
    test(
        "The 'emailFieldErrorText' value should be null if user input correct type of Email address",
        () async {
      loginViewModel.emailListener();
      loginViewModel.emailController.text = "kermani@gmail.com";
      loginViewModel.emailController.notifyListeners();
      expect(loginViewModel.emailFieldErrorText, null);
    });
    test(
        "The 'emailFieldErrorText' value should return message if user input incorrect type of Email address",
        () async {
      loginViewModel.emailListener();
      loginViewModel.emailController.text = "kermani.com";
      loginViewModel.emailController.notifyListeners();
      expect(loginViewModel.emailFieldErrorText, Messages.invalidEmail);
    });
    test(
        "The 'passwordFieldErrorText' value should be null if user input correct type of Password",
        () async {
      loginViewModel.passwordListener();
      loginViewModel.passwordController.text = "P@ssw0rd";
      loginViewModel.passwordController.notifyListeners();
      expect(loginViewModel.passwordFieldErrorText, null);
    });
    test(
        "The 'passwordFieldErrorText'  value should return message if user input incorrect type of Password",
        () async {
      loginViewModel.passwordListener();
      loginViewModel.passwordController.text = "123456";
      loginViewModel.passwordController.notifyListeners();
      expect(loginViewModel.passwordFieldErrorText, Messages.invalidPassword);
    });
    test(
        "The 'loginRequest' function should return failure if user input incorrect Password or Email address",
        () async {
      loginViewModel.emailAddress = EmailAddress("test@gmail.com");
      loginViewModel.password = Password("P@ssw0rd");
      final result = await loginViewModel.loginRequest();
      expect(result, const Left(AuthenticationFailure.wrongPasswordOrEmail()));
    });
  });
}
