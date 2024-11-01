import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:torliga/features/matches/presentation/widgets/custom_match_loading.dart';
import '../../../../core/constants/app_colors.dart';

class CustomLoadingCountryMatches extends StatelessWidget {
  const CustomLoadingCountryMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.cardColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 4,
                    width: 70,
                    color: Colors.grey[300],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              color: AppColors.cardSecondaryColor,
            ),
            child: Column(
              children: List.generate(
                3,
                (index) {
                  return CustomLoadingMatch();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
