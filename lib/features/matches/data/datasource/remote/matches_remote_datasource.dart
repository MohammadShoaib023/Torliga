import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:torliga/core/failure/failure.dart';
import '../../../../../core/constants/app_end_points.dart';
import '../../../../../core/services/api_service.dart';
import '../../../domain/entities/matches_entity.dart';
import '../../model/matches_model.dart';

abstract class MatchesRemoteDatasource {
  Future<Either<Failure, MatchesEntity>> fetchPastMatches();
  Future<Either<Failure, MatchesEntity>> fetchUpcomingMatches();
  Future<Either<Failure, MatchesEntity>> fetchTodayMatches();
}

class MatchesRemoteDatesourceImpl extends MatchesRemoteDatasource {
  final ApiService _client;

  MatchesRemoteDatesourceImpl(this._client);
  @override
  Future<Either<Failure, MatchesEntity>> fetchPastMatches() async {
    return await _client.get(
        url: ApiEndPoints.pastMatches, converter: (response) => response);
  }

  @override
  Future<Either<Failure, MatchesEntity>> fetchTodayMatches() async {
    return await _client.get(
        url: ApiEndPoints.todaysMatches, converter: (response) => response);
  }

  @override
  Future<Either<Failure, MatchesEntity>> fetchUpcomingMatches() async {
    return await _client.get(
        url: ApiEndPoints.todaysMatches, converter: (response) => response);
  }
}
