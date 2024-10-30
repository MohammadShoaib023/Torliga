import 'package:equatable/equatable.dart';
import 'package:torliga/features/matches/domain/entities/datum_entity.dart';

class MatchesEntity extends Equatable {
  final List<DatumEntity> datum;

  const MatchesEntity(this.datum);

  @override
  List<Object?> get props => [datum];
}
