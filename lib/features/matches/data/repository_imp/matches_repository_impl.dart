import 'package:dartz/dartz.dart';
import 'package:torliga/core/failure/failure.dart';
import 'package:torliga/features/matches/domain/entities/matches_entity.dart';
import '../../domain/repository/matches_repository.dart';
import '../datasource/remote/matches_remote_datasource.dart';

class MatchesRepositoryImpl extends MatchesRepository {
  final MatchesRemoteDatasource matchesRemoteDatasource;

  MatchesRepositoryImpl(this.matchesRemoteDatasource);
  @override
  Future<Either<Failure, MatchesEntity>> fetchPastMatches() {
    return matchesRemoteDatasource.fetchPastMatches();
  }

  @override
  Future<Either<Failure, MatchesEntity>> fetchTodayMatches() {
    return matchesRemoteDatasource.fetchTodayMatches();
  }

  @override
  Future<Either<Failure, MatchesEntity>> fetchUpcomingMatches() {
    return matchesRemoteDatasource.fetchUpcomingMatches();
  }
}
