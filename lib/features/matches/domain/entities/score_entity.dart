import 'package:equatable/equatable.dart';

class ScoreEntity extends Equatable {
  final String matchId;
  final int homeScore;
  final int awayScore;
  final DateTime timestamp;

  const ScoreEntity({
    required this.matchId,
    required this.homeScore,
    required this.awayScore,
    required this.timestamp,
  });

  @override
  List<Object?> get props => [matchId, homeScore, awayScore, timestamp];
}
