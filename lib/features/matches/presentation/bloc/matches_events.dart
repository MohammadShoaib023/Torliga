import 'package:equatable/equatable.dart';

sealed class MatchesEvents extends Equatable {
  const MatchesEvents();
}

class FetchTodayMatchesEvent extends MatchesEvents {
  @override
  List<Object?> get props => [];
}

class FetchPastMatchesEvent extends MatchesEvents {
  @override
  List<Object?> get props => [];
}

class FetchUpcomingMatchesEvent extends MatchesEvents {
  @override
  List<Object?> get props => [];
}
