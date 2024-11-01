import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/match_entity.dart';
import 'custom_match_widget.dart';

class CountryMatchesWidget extends StatefulWidget {
  final String countryName;
  final String flagAsset;
  final List<MatchEntity> matches;
  final bool isExpandedActive;

  const CountryMatchesWidget({
    super.key,
    required this.countryName,
    required this.flagAsset,
    required this.matches,
    this.isExpandedActive = true,
  });

  @override
  _CountryMatchesWidgetState createState() => _CountryMatchesWidgetState();
}

class _CountryMatchesWidgetState extends State<CountryMatchesWidget> {
  bool showMatches = true;

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
                    child: CachedNetworkImage(
                      imageUrl: widget.flagAsset,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  widget.countryName,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: AppColors.whiteColor,
                  ),
                ),
                const Spacer(),
                widget.isExpandedActive == true
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            showMatches = !showMatches;
                          });
                        },
                        child: Icon(
                          size: 18,
                          showMatches ? Icons.expand_less : Icons.expand_more,
                          color: AppColors.whiteColor,
                        ),
                      )
                    : SizedBox.shrink(),
                SizedBox(
                  width: 8,
                )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
              ),
              color: AppColors.cardSecondaryColor,
            ),
            child: showMatches
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.matches.length,
                    itemBuilder: (context, index) {
                      final match = widget.matches[index];
                      return CustomMatchWidget(
                        teamName1: match.homeTeam.name,
                        teamName2: match.awayTeam.name,
                        matchTime: match.matchTime,
                        teamLogo1: match.homeTeam.shirt,
                        teamLogo2: match.awayTeam.shirt,
                      );
                    },
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
