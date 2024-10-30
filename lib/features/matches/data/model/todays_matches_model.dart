import 'dart:convert';

import 'package:torliga/features/matches/domain/entities/todays_match_entity.dart';

import 'datum_model.dart';

class TodaysMatchesModel extends TodaysMatchEntity {
  const TodaysMatchesModel(super.datum);

  factory TodaysMatchesModel.fromRawJson(String str) =>
      TodaysMatchesModel.fromJson(json.decode(str));

  factory TodaysMatchesModel.fromJson(Map<String, dynamic> json) =>
      TodaysMatchesModel(
        List<DatumModel>.from(json["data"].map((x) => DatumModel.fromJson(x))),
      );
}
