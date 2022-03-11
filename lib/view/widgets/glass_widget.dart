import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlassWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  const GlassWidget({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * .8,
      height: height ?? Get.height * .8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 100.0,
            width: width ?? Get.width * .8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100.0,
              width: width ?? Get.width * .8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.0),
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.0),
                  ], stops: const [
                    0.01,
                    0.2
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 15,
                sigmaY: 15,
              ),
              child: Container(
                  width: width ?? Get.width * .8,
                  height: height ?? Get.height * .8,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.20),
                  ),
                  alignment: Alignment.center,
                  child: child),
            ),
          ),
        ],
      ),
    );
  }
}
