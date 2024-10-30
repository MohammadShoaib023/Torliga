import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/app_colors.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../fake_data.dart';
import '../widgets/country_matches_widgets.dart';
import '../widgets/custom_match_widget.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  List<MatchData> matchList = [
    MatchData(
      teamName1: "Valencia",
      teamName2: "Barcelona",
      matchTime: "23:30",
      teamLogo1: "assets/one.svg",
      teamLogo2: "assets/two.svg",
    ),
    MatchData(
      teamName1: "Valencia",
      teamName2: "Barcelona",
      matchTime: "23:30",
      teamLogo1: "assets/one.svg",
      teamLogo2: "assets/two.svg",
    ),
    MatchData(
      teamName1: "Real Madrid",
      teamName2: "Sevilla",
      matchTime: "20:15",
      teamLogo1: "assets/one.svg",
      teamLogo2: "assets/two.svg",
    ),
    // Add more matches as needed
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: ButtonsTabBar(
              width: screenWidth * 0.3,
              height: 45,
              labelStyle: GoogleFonts.chakraPetch(
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: AppColors.scaffoldColor,
                ),
              ),
              unselectedLabelStyle: GoogleFonts.chakraPetch(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.white24,
                ),
              ),
              contentCenter: true,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [AppColors.primaryColor, AppColors.secondaryColor],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              unselectedDecoration: BoxDecoration(
                color: AppColors.cardColor,
                borderRadius: BorderRadius.circular(12),
              ),
              tabs: const [
                Tab(
                  text: "Today",
                ),
                Tab(
                  text: "Upcoming",
                ),
                Tab(
                  text: "Past",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              itemCount:
                  4, // Change this to the number of items you want to display
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: CountryMatchesWidget(
                    countryName: "Spain",
                    leagueName: "LaLiga",
                    flagAsset: "assets/spain.svg",
                    matches: matchList,
                  ),
                );
              },
            ),
            Center(
                child: Text(
              "Hotel",
              style: TextStyle(color: Colors.white),
            )),
            Center(
                child: Text(
              "Hostel",
              style: TextStyle(color: Colors.white),
            )),
          ],
        ),
      ),
    );
  }
}
