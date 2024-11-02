import 'package:torliga/features/matches/domain/entities/score_entity.dart';

class ScoreModel extends ScoreEntity {
  const ScoreModel({
    required super.matchId,
    required super.homeScore,
    required super.awayScore,
    required super.timestamp,
  });

  factory ScoreModel.fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      matchId: json['matchId'] as String,
      homeScore: json['homeScore'] as int,
      awayScore: json['awayScore'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'matchId': matchId,
      'homeScore': homeScore,
      'awayScore': awayScore,
      'timestamp': timestamp.toIso8601String(),
    };
  }
}
