import '../../domain/entities/competition_entity.dart';

class CompetitionModel extends CompetitionEntity {
  const CompetitionModel({
    required super.id,
    required super.apiId,
    required super.name,
    required super.logo,
  });

  factory CompetitionModel.fromJson(Map<String, dynamic> json) =>
      CompetitionModel(
        id: json["id"],
        apiId: json["api_id"],
        name: json["name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "api_id": apiId,
        "name": name,
        "logo": logo,
      };
}
