import 'package:equatable/equatable.dart';

sealed class MatchesEvents extends Equatable {
  const MatchesEvents();
}

class FetchTodayMatches extends MatchesEvents {
  @override
  List<Object?> get props => [];
}

class FetchPastMatches extends MatchesEvents {
  @override
  List<Object?> get props => [];
}

class FetchUpcomingMatches extends MatchesEvents {
  @override
  List<Object?> get props => [];
}
