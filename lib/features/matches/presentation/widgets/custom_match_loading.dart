import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingMatch extends StatelessWidget {
  const CustomLoadingMatch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 32,
          ),
          Expanded(
              flex: 2,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 5,
                  color: Colors.grey[300],
                ),
              )),
          const SizedBox(width: 8),
          SizedBox(
              height: 24,
              width: 24,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300],
                ),
              )),
          const SizedBox(width: 8),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              height: 10,
              width: 30,
              color: Colors.grey[300],
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
              height: 24,
              width: 24,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  color: Colors.grey[300],
                ),
              )),
          const SizedBox(width: 8),
          Expanded(
              flex: 2,
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 5,
                  color: Colors.grey[300],
                ),
              )),
          SizedBox(
            width: 32,
          )
        ],
      ),
    );
  }
}
