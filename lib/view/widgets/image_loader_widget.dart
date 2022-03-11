import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ImageLoaderWidget extends StatelessWidget {
  final String url;
  final double width;
  final double height;
  const ImageLoaderWidget({
    Key? key,
    required this.url,
    this.width = 60.0,
    this.height = 60.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Image.network(
          url,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return _imageErrorWidget();
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress?.expectedTotalBytes == null) {
              return child;
            }
            return _imageLoadingWidget();
          },
        ),
      ),
    );
  }

  SizedBox _imageLoadingWidget() {
    return SizedBox(
      height: height,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(height),
        child: Shimmer(
          color: Colors.grey,
          child: SizedBox(
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }

  Container _imageErrorWidget() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(height),
      ),
      child: Center(
        child: Icon(
          Icons.person_rounded,
          size: (height - 20),
          color: Colors.grey,
        ),
      ),
    );
  }
}
