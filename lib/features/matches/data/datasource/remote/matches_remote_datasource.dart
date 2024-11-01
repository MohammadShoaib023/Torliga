import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:torliga/core/failure/failure.dart';
import '../../../../../core/constants/app_end_points.dart';
import '../../../../../core/network/network_info.dart';
import '../../../../../core/services/api_service.dart';
import '../../../domain/entities/matches_entity.dart';
import '../../model/matches_model.dart';

abstract class MatchesRemoteDatasource {
  Future<Either<Failure, MatchesModel>> fetchPastMatches();
  Future<Either<Failure, MatchesModel>> fetchUpcomingMatches();
  Future<Either<Failure, MatchesModel>> fetchTodayMatches();
}

class MatchesRemoteDatesourceImpl extends MatchesRemoteDatasource {
  final ApiService _client;
  final NetworkInfo networkInfo;

  MatchesRemoteDatesourceImpl(ApiService client, this.networkInfo)
      : _client = client;

  @override
  Future<Either<Failure, MatchesModel>> fetchPastMatches() async {
    if (await networkInfo.isConnected) {
      return await _client.get(
          url: ApiEndPoints.pastMatches, converter: (response) => response);
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
          url: ApiEndPoints.upcomingMatches, converter: (response) => response);
    } else {
      return Left(InternetDisconnectedFailure("No Internet"));
    }
  }
}
