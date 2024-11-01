import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/match_entity.dart';
import 'custom_match_widget.dart';

class CountryMatchesWidget extends StatelessWidget {
  final String countryName;
  final String flagAsset;
  final List<MatchEntity> matches;

  const CountryMatchesWidget({
    super.key,
    required this.countryName,
    required this.flagAsset,
    required this.matches,
  });

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
            padding: EdgeInsets.symmetric(vertical: 7, horizontal: 6),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CachedNetworkImage(
                        imageUrl: flagAsset,
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    )),
                SizedBox(width: 8),
                Text(
                  countryName,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              color: AppColors.cardSecondaryColor,
            ),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: matches.length,
              itemBuilder: (context, index) {
                final match = matches[index];
                return CustomMatchWidget(
                  teamName1: match.homeTeam.name,
                  teamName2: match.awayTeam.name,
                  matchTime: match.matchTime,
                  teamLogo1: match.homeTeam.shirt,
                  teamLogo2: match.awayTeam.shirt,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
