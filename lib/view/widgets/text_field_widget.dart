import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hint;
  final String? errorText;
  final TextEditingController? textEditingController;
  const TextFieldWidget({
    Key? key,
    required this.hint,
    this.errorText,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 48.0,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)))),
        TextField(
          controller: textEditingController,
          decoration: InputDecoration(
              errorText: errorText,
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.greenAccent[700]!, width: 2)),
              errorStyle: TextStyle(
                  color: Colors.pinkAccent[400]!,
                  fontSize: 13.0,
                  fontWeight: FontWeight.w500),
              errorBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.pinkAccent[400]!, width: 2)),
              contentPadding: const EdgeInsets.only(right: 8.0, left: 8.0),
              hintText: hint,
              hintStyle: const TextStyle(color: Colors.black)),
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15.0),
        ),
      ],
    );
  }
}
