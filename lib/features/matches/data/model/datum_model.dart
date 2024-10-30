import 'dart:convert';
import 'package:torliga/features/matches/data/model/match_model.dart';
import 'package:torliga/features/matches/domain/entities/datum_entity.dart';

import 'competition_model.dart';

class DatumModel extends DatumEntity {
  const DatumModel({super.matches, super.competition});

  factory DatumModel.fromRawJson(String str) =>
      DatumModel.fromJson(json.decode(str));

  factory DatumModel.fromJson(Map<String, dynamic> json) => DatumModel(
        competition: CompetitionModel.fromJson(json["competition"]),
        matches: List<MatchModel>.from(
          json["matches"].map(
            (x) => MatchModel.fromJson(x),
          ),
        ),
      );
}
