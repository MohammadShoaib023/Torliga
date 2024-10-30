import 'package:dartz/dartz.dart';
import '../../../../core/failure/failure.dart';
import '../entities/datum_entity.dart';

abstract class MatchesRepository {
  Future<Either<Failure, List<DatumEntity>>> fetchPastMatches();
  Future<Either<Failure, List<DatumEntity>>> fetchTodayMatches();
  Future<Either<Failure, List<DatumEntity>>> fetchUpcomingMatches();
}
