import 'package:equatable/equatable.dart';
import 'package:torliga/features/matches/domain/entities/competition_entity.dart';
import 'package:torliga/features/matches/domain/entities/match_entity.dart';

class DatumEntity extends Equatable {
  final CompetitionEntity? competition;
  final List<MatchEntity>? matches;

  const DatumEntity({required this.competition, required this.matches});

  @override
  List<Object?> get props => [competition, matches];
}
