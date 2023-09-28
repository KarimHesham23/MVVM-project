import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingImage extends StatelessWidget {
  const CustomLoadingImage({super.key, required this.aspectRatio});
  final double aspectRatio;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
