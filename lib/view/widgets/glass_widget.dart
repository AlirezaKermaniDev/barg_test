import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlassWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final double? blurBar;
  final BorderRadius? borderRadius;
  final Widget child;
  const GlassWidget({
    Key? key,
    required this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.blurBar,
  }) : super(key: key);
  bool get isFullScreen => height == Get.height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? Get.width * .8,
      height: height ?? Get.height * .8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _bottomShadowWidget(),
          _topShadowWidget(),
          _blurWidget(),
        ],
      ),
    );
  }

  ClipRRect _blurWidget() {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(35.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blurBar ?? 15,
          sigmaY: blurBar ?? 15,
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
    );
  }

  SingleChildRenderObjectWidget _topShadowWidget() {
    return isFullScreen
        ? const SizedBox()
        : Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 100.0,
              width: width ?? Get.width * .8,
              decoration: BoxDecoration(
                  borderRadius: borderRadius ?? BorderRadius.circular(35.0),
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.8),
                    Colors.white.withOpacity(0.0),
                  ], stops: const [
                    0.01,
                    0.2
                  ], end: Alignment.bottomCenter, begin: Alignment.topCenter)),
            ),
          );
  }

  Widget _bottomShadowWidget() {
    return isFullScreen
        ? const SizedBox()
        : Container(
            height: 100.0,
            width: width ?? Get.width * .8,
            decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(35.0),
                gradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          );
  }
}
