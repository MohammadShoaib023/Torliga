import 'dart:convert';

import 'package:torliga/features/matches/domain/entities/match_entity.dart';

import 'team_model.dart';

class MatchModel extends MatchEntity {
  const MatchModel({
    required super.id,
    required super.apiId,
    required super.homeTeam,
    required super.awayTeam,
    required super.matchStatusId,
    required super.matchStatusDescription,
    required super.matchDay,
    required super.matchTime,
    required super.kickOff,
    required super.mustDisplay,
    required super.published,
  });

  factory MatchModel.fromRawJson(String str) =>
      MatchModel.fromJson(json.decode(str));

  factory MatchModel.fromJson(Map<String, dynamic> json) => MatchModel(
        id: json["id"],
        apiId: json["api_id"],
        homeTeam: TeamModel.fromJson(json["home_team"]),
        awayTeam: TeamModel.fromJson(json["away_team"]),
        matchStatusId: json["match_status_id"],
        matchStatusDescription: json["match_status_description"],
        matchDay: json["match_day"],
        matchTime: json["match_time"],
        kickOff: json["kick_off"],
        mustDisplay: json["must_display"],
        published: json["published"],
      );
}
