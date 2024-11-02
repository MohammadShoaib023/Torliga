import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:torliga/core/failure/failure.dart';
import '../../../../../core/constants/app_end_points.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/services/api_service.dart';
import '../../../../../core/services/websocket_service.dart';
import '../../model/matches_model.dart';
import '../../model/score_model.dart';

abstract class MatchesRemoteDatasource {
  Future<Either<Failure, MatchesModel>> fetchPastMatches();
  Future<Either<Failure, MatchesModel>> fetchUpcomingMatches();
  Future<Either<Failure, MatchesModel>> fetchTodayMatches();
  Stream<ScoreModel> listenForScoreUpdates();
}

class MatchesRemoteDatesourceImpl extends MatchesRemoteDatasource {
  final ApiService _client;
  final NetworkInfo networkInfo;
  final WebSocketService _webSocketService;

  MatchesRemoteDatesourceImpl(
      ApiService client, this.networkInfo, this._webSocketService)
      : _client = client;

  @override
  Future<Either<Failure, MatchesModel>> fetchPastMatches() async {
    if (await networkInfo.isConnected) {
      return await _client.get(
          url: ApiEndPoints.pastMatches,
          converter: (response) => MatchesModel.fromJson(response));
    } else {
      return Left(InternetDisconnectedFailure("No Internet"));
    }
  }

  @override
  Future<Either<Failure, MatchesModel>> fetchTodayMatches() async {
    if (await networkInfo.isConnected) {
      return await _client.get(
          url: ApiEndPoints.todaysMatches,
          converter: (response) => MatchesModel.fromJson(response));
    } else {
      return Left(InternetDisconnectedFailure("No Internet"));
    }
  }

  @override
  Future<Either<Failure, MatchesModel>> fetchUpcomingMatches() async {
    if (await networkInfo.isConnected) {
      return await _client.get(
          url: ApiEndPoints.upcomingMatches,
          converter: (response) => MatchesModel.fromJson(response));
    } else {
      return Left(InternetDisconnectedFailure("No Internet"));
    }
  }

  // Listen to WebSocket Score Updates
  @override
  @override
  Stream<ScoreModel> listenForScoreUpdates() {
    return _webSocketService.scoreStream;
  }
}
