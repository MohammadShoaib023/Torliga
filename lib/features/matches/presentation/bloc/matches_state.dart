import 'package:equatable/equatable.dart';

import '../../../../core/enums/bloc_status.dart';
import '../../domain/entities/datum_entity.dart';

class MatchesState extends Equatable {
  final BlocStateStatus status;
  final List<DatumEntity>? todaysMatches;
  final List<DatumEntity>? pastMatches;
  final List<DatumEntity>? upcomingMatches;

  const MatchesState({
    this.status = BlocStateStatus.initial,
    this.todaysMatches = const [],
    this.pastMatches = const [],
    this.upcomingMatches = const [],
  });
  @override
  List<Object?> get props => [
        todaysMatches,
        pastMatches,
        upcomingMatches,
        status,
      ];
}
