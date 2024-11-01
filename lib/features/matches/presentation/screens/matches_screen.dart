import 'package:flutter/material.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_bloc.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_events.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_colors.dart';
import '../widgets/custom_loading_country_matches.dart';
import '../widgets/gradient_background.dart';
import 'loading_matches.dart';
import 'past_matches.dart';
import 'today_matches.dart';
import 'upcoming_matches.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController(initialPage: _tabController.index);
    _tabController.addListener(_handleTabChange);
    _loadDataForTab(_tabController.index);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      _pageController.jumpToPage(_tabController.index);
      _loadDataForTab(_tabController.index);
    }
  }

  void _onPageChanged(int pageIndex) {
    if (pageIndex != _tabController.index) {
      _tabController.animateTo(pageIndex);
      _loadDataForTab(pageIndex);
    }
  }

  void _loadDataForTab(int index) {
    switch (index) {
      case 0: // "Today" tab
        BlocProvider.of<MatchesBloc>(context).add(FetchTodayMatchesEvent());
        break;
      case 1: // "Upcoming" tab
        BlocProvider.of<MatchesBloc>(context).add(FetchUpcomingMatchesEvent());
        break;
      case 2: // "Past" tab
        BlocProvider.of<MatchesBloc>(context).add(FetchPastMatchesEvent());
        break;
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.scaffoldColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: ButtonsTabBar(
              controller: _tabController,
              width: MediaQuery.of(context).size.width * 0.3,
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
                  color: AppColors.textCardColor,
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
                Tab(text: "Today"),
                Tab(text: "Upcoming"),
                Tab(text: "Past"),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            GradientBackgroundWidget(),
            PageView(
              controller: _pageController,
              onPageChanged: _onPageChanged,
              children: [
                TodayMatches(),
                UpcomingMatches(),
                PastMatches(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
