import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String? errorText;
  final TextEditingController controller;
  const TextFieldWidget({
    Key? key,
    required this.hint,
    this.errorText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _backgroundWidget(),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              errorText: errorText,
              errorMaxLines: 6,
              focusedBorder: _enabledBorder(),
              enabledBorder: _enabledBorder(),
              errorStyle: _errorStyle(),
              errorBorder: _errorBorder(),
              contentPadding: const EdgeInsets.only(right: 8.0, left: 8.0),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black)),
          style: _style(),
        ),
      ],
    );
  }

  TextStyle _style() {
    return const TextStyle(
        fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.0);
  }

  UnderlineInputBorder _errorBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.pinkAccent[400]!, width: 2));
  }

  TextStyle _errorStyle() {
    return TextStyle(
        color: Colors.pink[200], fontSize: 13.0, fontWeight: FontWeight.w500);
  }

  UnderlineInputBorder _enabledBorder() {
    return UnderlineInputBorder(
        borderSide: BorderSide(
            color: controller.value.text.isEmpty
                ? Colors.transparent
                : Colors.greenAccent[700]!,
            width: 2));
  }

  Container _backgroundWidget() {
    return Container(
        height: 48.0,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0))));
  }
}
