import 'package:barg_test/core/failure/authentication_failure/authentication_failure.dart';
import 'package:barg_test/core/messages.dart';
import 'package:barg_test/dependency_injection.dart';
import 'package:barg_test/model/authentication_model/email_address.dart';
import 'package:barg_test/model/authentication_model/password.dart';
import 'package:barg_test/repository/authentication_repository/authentication_repository.dart';
import 'package:barg_test/view_model/utils/show_snack_bar.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginViewModel extends GetxController {
  bool isLogging = false;
  String? emailFieldErrorText;
  String? passwordFieldErrorText;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  EmailAddress emailAddress = EmailAddress("");
  Password password = Password("");

  void changeIsLoggingStatus(bool status) {
    isLogging = status;
    update();
  }

  void emailListener() {
    emailController.addListener(() {
      print(emailController.value.text);
      emailAddress = EmailAddress(emailController.value.text);
      if (emailAddress.isValid()) {
        emailFieldErrorText = null;
      } else {
        emailFieldErrorText = Messages.invalidEmail;
      }

      update();
    });
  }

  void passwordListener() {
    passwordController.addListener(() {
      password = Password(passwordController.value.text);
      if (password.isValid()) {
        passwordFieldErrorText = null;
      } else {
        passwordFieldErrorText = Messages.invalidPassword;
      }

      update();
    });
  }

  isEmailAndPasswordValid() {
    return emailAddress.isValid() && password.isValid();
  }

  Future<void> loginToApp() async {
    changeIsLoggingStatus(true);
    Either<AuthenticationFailure, bool> result = await loginRequest();

    checkResultOfLogin(result);
    changeIsLoggingStatus(false);
  }

  void checkResultOfLogin(Either<AuthenticationFailure, bool> result) {
    result.fold((failure) {
      showSnackBar(Messages.authenticationFailureToMessage[failure]!);
    }, (status) {
      Get.snackbar("System", "Loggedin");
    });
  }

  Future<Either<AuthenticationFailure, bool>> loginRequest() async {
    final result = await di<AuthenticationRepository>()
        .loginWithEmailAndPassword(
            emailAddress: emailAddress, password: password);
    return result;
  }

  @override
  void onReady() {
    emailListener();
    passwordListener();
    super.onReady();
  }
}
