import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:torliga/core/extensions/time_extension.dart';

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
          SizedBox(width: 4),
          Expanded(
            flex: 2,
            child: AutoSizeText(
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
            child: CachedNetworkImage(
              imageUrl: teamLogo1,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 8),
          Text(
            matchTime.toAmPmFormat(),
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
            child: CachedNetworkImage(
              imageUrl: teamLogo1,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                height: 20,
                width: 20,
                child: const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            flex: 2,
            child: AutoSizeText(
              teamName2,
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.whiteColor,
              ),
            ),
          ),
          SizedBox(width: 4),
        ],
      ),
    );
  }
}
