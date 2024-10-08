import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PropertyShimmer extends StatelessWidget {
  const PropertyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[100]!,
      baseColor: Colors.grey[300]!,
      child: SizedBox(
        height: 250,
        width: double.infinity,
        child: Card(
          color: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const SizedBox(),
        ),
      ),
    );
  }
}
