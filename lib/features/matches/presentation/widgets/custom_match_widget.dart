import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';

class CustomMatchWidget extends StatelessWidget {
  final String teamName1;
  final String teamName2;
  final String matchTime;
  final String teamLogo1;
  final String teamLogo2;

  const CustomMatchWidget({
    super.key,
    required this.teamName1,
    required this.teamName2,
    required this.matchTime,
    required this.teamLogo1,
    required this.teamLogo2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              teamName1,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              teamLogo1,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Text(
            matchTime,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(width: 8),
          SizedBox(
            height: 32,
            width: 32,
            child: SvgPicture.asset(
              teamLogo2,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: Text(
              teamName2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
