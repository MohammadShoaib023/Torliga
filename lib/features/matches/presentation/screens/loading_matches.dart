import 'package:flutter/material.dart';
import '../widgets/custom_loading_country_matches.dart';

class LoadingMatches extends StatelessWidget {
  const LoadingMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      itemCount: 4,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CustomLoadingCountryMatches(),
        );
      },
    );
  }
}
