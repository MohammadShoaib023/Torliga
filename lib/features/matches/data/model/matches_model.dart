import 'dart:convert';

import 'package:torliga/features/matches/domain/entities/matches_entity.dart';

import 'datum_model.dart';

class MatchesModel extends MatchesEntity {
  const MatchesModel(super.datum);

  factory MatchesModel.fromRawJson(String str) =>
      MatchesModel.fromJson(json.decode(str));

  factory MatchesModel.fromJson(Map<String, dynamic> json) => MatchesModel(
        List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
      );
}
