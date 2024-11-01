import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/matches_entity.dart';
import '../repository/matches_repository.dart';

class FetchPastMatchesUseCase extends UseCase<MatchesEntity, NoParams> {
  final MatchesRepository matchesRepository;
  FetchPastMatchesUseCase(this.matchesRepository);

  @override
  Future<Either<Failure, MatchesEntity>> call(NoParams params) {
    return matchesRepository.fetchPastMatches();
  }
}
