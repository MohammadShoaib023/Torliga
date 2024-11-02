import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/matches_entity.dart';
import '../entities/score_entity.dart';

abstract class MatchesRepository {
  Future<Either<Failure, MatchesEntity>> fetchPastMatches();
  Future<Either<Failure, MatchesEntity>> fetchTodayMatches();
  Future<Either<Failure, MatchesEntity>> fetchUpcomingMatches();
  Stream<ScoreEntity> listenForScoreUpdates();
}
