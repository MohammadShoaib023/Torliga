import 'dart:convert';

import 'package:torliga/features/matches/domain/entities/team_entity.dart';

class TeamModel extends TeamEntity {
  const TeamModel({
    required super.id,
    required super.apiId,
    required super.name,
    required super.shortName,
    required super.logo,
    required super.score,
    required super.shirt,
    required super.isDefaultShirt,
    required super.national,
  });

  factory TeamModel.fromRawJson(String str) =>
      TeamModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        id: json["id"],
        apiId: json["api_id"],
        name: json["name"],
        shortName: json["short_name"],
        logo: json["logo"],
        score: List<int>.from(json["score"].map((x) => x)),
        shirt: json["shirt"],
        isDefaultShirt: json["is_default_shirt"],
        national: json["national"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "api_id": apiId,
        "name": name,
        "short_name": shortName,
        "logo": logo,
        "score": List<dynamic>.from(score.map((x) => x)),
        "shirt": shirt,
        "is_default_shirt": isDefaultShirt,
        "national": national,
      };
}
