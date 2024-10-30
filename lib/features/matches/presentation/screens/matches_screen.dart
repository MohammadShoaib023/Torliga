import 'package:flutter/material.dart';

class MatchesScreen extends StatelessWidget {
  const MatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color.fromRGBO(26, 26, 26, 1),
        body: SafeArea(
            child: Stack(
          children: [
            
            MatchScreen(),
          ],
        )));
  }
}

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [
        // Replace these with your actual content
        SingleChildScrollView(
          child: Center(child: Text("Today's Matches")),
        ),
        SingleChildScrollView(
          child: Center(child: Text("Upcoming Matches")),
        ),
        SingleChildScrollView(
          child: Center(child: Text("Past Matches")),
        ),
      ],
    );
  }
}
