import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/matches_entity.dart';
import '../repository/matches_repository.dart';

class FetchUpcomingMatchesUseCase extends UseCase<MatchesEntity, NoParams> {
  final MatchesRepository matchesRepository;
  FetchUpcomingMatchesUseCase(this.matchesRepository);

  @override
  Future<Either<Failure, MatchesEntity>> call(NoParams params) {
    return matchesRepository.fetchUpcomingMatches();
  }
}
