import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:torliga/core/enums/bloc_status.dart';
import 'package:torliga/core/usecase/usecase.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_events.dart';
import 'package:torliga/features/matches/presentation/bloc/matches_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/logger.dart';
import '../../domain/usecases/fetch_past_matches_use_case.dart';
import '../../domain/usecases/fetch_todays_matches_use_case.dart';
import '../../domain/usecases/fetch_upcoming_matches_use_case.dart';

class MatchesBloc extends Bloc<MatchesEvents, MatchesState> {
  final FetchUpcomingMatchesUseCase fetchUpcomingMatchesUseCase;
  final FetchPastMatchesUseCase fetchPastMatchesUseCase;
  final FetchTodaysMatchesUseCase fetchTodaysMatchesUseCase;

  MatchesBloc(this.fetchUpcomingMatchesUseCase, this.fetchPastMatchesUseCase,
      this.fetchTodaysMatchesUseCase)
      : super(MatchesState()) {
    on<FetchTodayMatchesEvent>(_fetchTodayMatches);
    on<FetchPastMatchesEvent>(_fetchPastMatches);
    on<FetchUpcomingMatchesEvent>(_fetchUpcomingMatches);
  }

  FutureOr<void> _fetchTodayMatches(
      FetchTodayMatchesEvent event, Emitter<MatchesState> emit) async {
    emit(state.copyWith(todaysMatchesStatus: BlocStateStatus.inProgress));
    emit(state.copyWith(pastMatches: null, upcomingMatches: null));
    try {
      final response = await fetchTodaysMatchesUseCase.call(NoParams());

      response.fold((failure) {
        emit(state.copyWith(todaysMatchesStatus: BlocStateStatus.failure));
      }, (data) {
        if (kDebugMode) {
          logger.e("Today Matches $data");
        }

        emit(state.copyWith(
            todaysMatches: data, todaysMatchesStatus: BlocStateStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(todaysMatchesStatus: BlocStateStatus.failure));
    }
  }

  FutureOr<void> _fetchPastMatches(
      FetchPastMatchesEvent event, Emitter<MatchesState> emit) async {
    emit(state.copyWith(pastMatchesStatus: BlocStateStatus.inProgress));
    emit(state.copyWith(todaysMatches: null, upcomingMatches: null));

    try {
      final response = await fetchPastMatchesUseCase.call(NoParams());

      response.fold((failure) {
        emit(state.copyWith(pastMatchesStatus: BlocStateStatus.failure));
      }, (data) {
        if (kDebugMode) {
          logger.e("Past Matches $data");
        }

        emit(state.copyWith(
            pastMatches: data, pastMatchesStatus: BlocStateStatus.success));
      });
    } catch (e) {
      emit(state.copyWith(pastMatchesStatus: BlocStateStatus.failure));
    }
  }

  FutureOr<void> _fetchUpcomingMatches(
      FetchUpcomingMatchesEvent event, Emitter<MatchesState> emit) async {
    emit(state.copyWith(upcomingMatchesStatus: BlocStateStatus.inProgress));
    emit(state.copyWith(todaysMatches: null, pastMatches: null));
    try {
      final response = await fetchUpcomingMatchesUseCase.call(NoParams());

      response.fold((failure) {
        emit(state.copyWith(upcomingMatchesStatus: BlocStateStatus.failure));
      }, (data) {
        if (kDebugMode) {
          logger.e("Past Matches $data");
        }

        emit(state.copyWith(
          upcomingMatches: data,
          upcomingMatchesStatus: BlocStateStatus.success,
        ));
      });
    } catch (e) {
      emit(state.copyWith(upcomingMatchesStatus: BlocStateStatus.failure));
    }
  }
}
