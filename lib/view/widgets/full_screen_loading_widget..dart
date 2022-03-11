import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'glass_widget.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  const FullScreenLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GlassWidget(
      height: Get.height,
      width: Get.width,
      blurBar: 5.0,
      borderRadius: BorderRadius.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            size: 30.0,
            itemCount: 4,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 8.0),
          const Text(
            "Loading...",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
