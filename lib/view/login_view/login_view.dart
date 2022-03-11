import 'dart:ui';

import 'package:barg_test/core/assets.dart';
import 'package:barg_test/view/widgets/glass_widget.dart';
import 'package:barg_test/view/widgets/text_field_widget.dart';
import 'package:barg_test/view_model/login_view_model.dart/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginViewModel> {
  static const path = "/LoginView";
  const LoginView({Key? key}) : super(key: key);

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
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(6.0),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
                  backgroundColor: MaterialStateProperty.all(Colors.white)),
              child: const Text(
                "Log in",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black),
              ),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Don`t have an account? ",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
              Text(
                "Create New",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _glassBodyTextFieldsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: const [
        Padding(
          padding: EdgeInsets.only(bottom: 28.0),
          child: TextFieldWidget(hint: "Email"),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: TextFieldWidget(hint: "Password"),
        ),
        Text(
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

  Text _glassBodyHeaderWidget() {
    return const Text(
      "Welcome",
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 40, color: Colors.white),
    );
  }
}
