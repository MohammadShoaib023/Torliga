import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import '../../../../core/constants/app_colors.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
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
            preferredSize: const Size.fromHeight(60.0), // Adjust preferred size
            child: ButtonsTabBar(
              width: screenWidth * 0.3,
              height: 45,
              labelStyle: const TextStyle(
                  fontSize: 12,
                  
                  fontWeight: FontWeight.w700,
                  color: AppColors.scaffoldColor),
              unselectedLabelStyle: const TextStyle(color: Colors.white24),
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
        body: const TabBarView(
          children: [
            Center(
                child: Text(
              "Home",
              // style: textStyle,
            )),
            Center(
                child: Text(
              "Hotel",
              // style: textStyle,
            )),
            Center(
                child: Text(
              "Hostel",
              // style: textStyle,
            )),
          ],
        ),
      ),
    );
  }
}
