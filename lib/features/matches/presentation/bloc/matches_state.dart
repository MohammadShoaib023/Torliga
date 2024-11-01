import 'package:equatable/equatable.dart';
import '../../../../core/enums/bloc_status.dart';
import '../../domain/entities/matches_entity.dart';

class MatchesState extends Equatable {
  final BlocStateStatus todaysMatchesStatus;
  final BlocStateStatus pastMatchesStatus;
  final BlocStateStatus upcomingMatchesStatus;
  final String? errorMessage;
  final MatchesEntity? todaysMatches;
  final MatchesEntity? pastMatches;
  final MatchesEntity? upcomingMatches;

  const MatchesState({
    this.todaysMatchesStatus = BlocStateStatus.initial,
    this.pastMatchesStatus = BlocStateStatus.initial,
    this.upcomingMatchesStatus = BlocStateStatus.initial,
    this.todaysMatches,
    this.pastMatches,
    this.upcomingMatches,
    this.errorMessage,
  });

  MatchesState copyWith({
    BlocStateStatus? todaysMatchesStatus,
    BlocStateStatus? pastMatchesStatus,
    BlocStateStatus? upcomingMatchesStatus,
    MatchesEntity? todaysMatches,
    MatchesEntity? pastMatches,
    MatchesEntity? upcomingMatches,
    final String? errorMessage,
  }) =>
      MatchesState(
        todaysMatchesStatus: todaysMatchesStatus ?? this.todaysMatchesStatus,
        pastMatchesStatus: pastMatchesStatus ?? this.pastMatchesStatus,
        upcomingMatchesStatus:
            upcomingMatchesStatus ?? this.upcomingMatchesStatus,
        todaysMatches: todaysMatches ?? this.todaysMatches,
        pastMatches: pastMatches ?? this.pastMatches,
        upcomingMatches: upcomingMatches ?? this.upcomingMatches,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [
        todaysMatches,
        pastMatches,
        upcomingMatches,
        todaysMatchesStatus,
        pastMatchesStatus,
        upcomingMatchesStatus,
        errorMessage
      ];
}
