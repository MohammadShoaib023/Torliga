import 'package:torliga/features/matches/presentation/bloc/matches_events.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MatchesBloc extends Bloc<MatchesEvents, MatchesState> {
  MatchesBloc() : super(const MatchesState()) {
    on<FetchTodayMatches>((event, emit) => _fetchTodayMatches(emit));
    on<FetchPastMatches>((event, emit) => _fetchPastMatches(emit));
    on<FetchUpcomingMatches>((event, emit) => _fetchUpcomingMatches(emit));
  }

  Future<void> _fetchUpcomingMatches(Emitter<MatchesState> emit) async {}

  Future<void> _fetchPastMatches(Emitter<MatchesState> emit) async {}

  Future<void> _fetchTodayMatches(Emitter<MatchesState> emit) async {}
}
