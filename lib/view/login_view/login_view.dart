import 'dart:ui';

import 'package:barg_test/core/assets.dart';
import 'package:barg_test/view/widgets/glass_widget.dart';
import 'package:barg_test/view/widgets/text_field_widget.dart';
import 'package:barg_test/view_model/login_view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginView extends StatelessWidget {
  static const path = "/LoginView";
  final controller = Get.put<LoginViewModel>(LoginViewModel());
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _loginViewBodyWidget(),
    );
  }

  Container _loginViewBodyWidget() {
    return Container(
      width: Get.width,
      height: Get.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AssetsPath.loginBackgroundImage,
            ),
            fit: BoxFit.cover),
      ),
      child: Center(
        child: _glassWidget(),
      ),
    );
  }

  GlassWidget _glassWidget() {
    return GlassWidget(
      width: Get.width * .8,
      height: Get.height * .85,
      child: _glassBodyWidget(),
    );
  }

  Padding _glassBodyWidget() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _glassBodyHeaderWidget(),
          _glassBodyTextFieldsWidget(),
          _glassBodyLoginButtonWidget(),
          const SizedBox(
            height: 4.0,
          )
        ],
      ),
    );
  }

  Padding _glassBodyLoginButtonWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 28.0),
      child: Column(
        children: [
          SizedBox(
            height: 45.0,
            width: Get.width,
            child: _loginButtonWidget(),
          ),
        ],
      ),
    );
  }

  GetBuilder<LoginViewModel> _loginButtonWidget() {
    return GetBuilder<LoginViewModel>(builder: (controller) {
      return ElevatedButton(
        onPressed: controller.isEmailAndPasswordValid() && !controller.isLogging
            ? controller.loginToApp
            : null,
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.black26),
          elevation: MaterialStateProperty.all(
              controller.isEmailAndPasswordValid() ? 5.0 : 0.0),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor: MaterialStateProperty.all(
              controller.isEmailAndPasswordValid()
                  ? Colors.black
                  : Colors.grey),
        ),
        child: controller.isLogging
            ? _logginLoadingWidget()
            : const Text(
                "Log in",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
      );
    });
  }

  SpinKitWave _logginLoadingWidget() {
    return SpinKitWave(
      size: 20.0,
      itemCount: 4,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.black),
      ),
    );
  }

  Column _glassBodyTextFieldsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _textFeildsWidget(),
        const Text(
          "Forgot password?",
          style: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              fontSize: 15,
              color: Colors.white),
        ),
      ],
    );
  }

  GetBuilder<LoginViewModel> _textFeildsWidget() {
    return GetBuilder<LoginViewModel>(builder: (controller) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 28.0),
            child: TextFieldWidget(
              hint: "Email",
              controller: controller.emailController,
              errorText: controller.emailFieldErrorText,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFieldWidget(
                hint: "Password",
                controller: controller.passwordController,
                errorText: controller.passwordFieldErrorText),
          ),
        ],
      );
    });
  }

  Text _glassBodyHeaderWidget() {
    return const Text(
      "Welcome",
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 40, color: Colors.white),
    );
  }
}
