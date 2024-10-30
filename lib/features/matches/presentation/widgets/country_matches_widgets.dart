import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../fake_data.dart';
import 'custom_match_widget.dart';

class CountryMatchesWidget extends StatelessWidget {
  final String countryName;
  final String leagueName;
  final String flagAsset;
  final List<MatchData> matches;

  const CountryMatchesWidget({
    super.key,
    required this.countryName,
    required this.leagueName,
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
                // Flag Icon
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      flagAsset,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 8),

                // Country and League Name
                Text(
                  "$countryName - $leagueName",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),

          // List of Matches
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
                  teamName1: match.teamName1,
                  teamName2: match.teamName2,
                  matchTime: match.matchTime,
                  teamLogo1: match.teamLogo1,
                  teamLogo2: match.teamLogo2,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
