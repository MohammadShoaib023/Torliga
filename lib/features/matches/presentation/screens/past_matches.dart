import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:torliga/core/enums/bloc_status.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_bloc.dart';

import '../bloc/matches_state.dart';
import '../widgets/country_matches_widgets.dart';
import 'loading_matches.dart';

class PastMatches extends StatelessWidget {
  const PastMatches({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesBloc, MatchesState>(
      builder: (context, state) {
        switch (state.pastMatchesStatus) {
          case BlocStateStatus.inProgress:
            return const LoadingMatches();

          case BlocStateStatus.failure:
            return _buildError();

          case BlocStateStatus.success:
            if (state.pastMatches?.datum == null ||
                state.pastMatches!.datum.isEmpty) {
              return _buildNoMatchesMessage();
            }
            return _buildMatchesList(state);

          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  // Widget for the error message
  Widget _buildError() {
    return const Expanded(
      child: Center(
        child: Text("Error"),
      ),
    );
  }

  // Widget for the "No matches today" message
  Widget _buildNoMatchesMessage() {
    return const Expanded(
      child: Center(
        child: Text("No Matches exist today"),
      ),
    );
  }

  // Widget to build the matches list
  Widget _buildMatchesList(MatchesState state) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      itemCount: state.pastMatches?.datum.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CountryMatchesWidget(
              isExpandedActive: index == 0 ? false : true,
              countryName: state.pastMatches!.datum[index].competition!.name,
              flagAsset: state.pastMatches!.datum[index].competition!.logo,
              matches: state.pastMatches!.datum[index].matches!,
            ));
      },
    );
  }
}
