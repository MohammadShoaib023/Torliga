import 'package:equatable/equatable.dart';
import 'package:torliga/features/matches/domain/entities/team_entity.dart';

class MatchEntity extends Equatable {
  final String id;
  final String apiId;
  final TeamEntity homeTeam;
  final TeamEntity awayTeam;
  final int matchStatusId;
  final String matchStatusDescription;
  final String matchDay;
  final String matchTime;
  final int kickOff;
  final int mustDisplay;
  final int published;

  const MatchEntity({
    required this.id,
    required this.apiId,
    required this.homeTeam,
    required this.awayTeam,
    required this.matchStatusId,
    required this.matchStatusDescription,
    required this.matchDay,
    required this.matchTime,
    required this.kickOff,
    required this.mustDisplay,
    required this.published,
  });

  @override
  List<Object?> get props => [
        id,
        apiId,
        homeTeam,
        awayTeam,
        matchStatusId,
        matchStatusDescription,
        matchDay,
        matchTime,
        kickOff,
        mustDisplay,
        published,
      ];
}
