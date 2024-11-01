import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:torliga/core/constants/app_colors.dart';

class GradientBackgroundWidget extends StatelessWidget {
  const GradientBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 291,
      left: 284,
      child: Container(
        width: 188,
        height: 188,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [AppColors.primaryColor, AppColors.secondaryColor],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
            ),
          ),
        ),
      ),
    );
  }
}
