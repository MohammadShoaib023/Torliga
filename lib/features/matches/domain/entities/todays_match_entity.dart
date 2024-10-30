import 'package:equatable/equatable.dart';
import 'package:torliga/features/matches/domain/entities/datum_entity.dart';

class TodaysMatchEntity extends Equatable {
  final List<DatumEntity> datum;

  const TodaysMatchEntity(this.datum);

  @override
  List<Object?> get props => [datum];
}
