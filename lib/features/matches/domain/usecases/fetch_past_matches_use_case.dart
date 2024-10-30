import 'package:dartz/dartz.dart';

import '../../../../core/failure/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/datum_entity.dart';
import '../repository/matches_repository.dart';

class FetchPastMatchesUseCase extends UseCase<List<DatumEntity>, NoParams> {
  final MatchesRepository matchesRepository;
  FetchPastMatchesUseCase(this.matchesRepository);

  @override
  Future<Either<Failure, List<DatumEntity>>> call(NoParams params) {
    return matchesRepository.fetchPastMatches();
  }
}
