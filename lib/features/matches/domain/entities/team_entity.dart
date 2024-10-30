import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final String id;
  final String apiId;
  final String name;
  final String shortName;
  final String logo;
  final List<int> score;
  final String shirt;
  final bool isDefaultShirt;
  final bool national;

  const TeamEntity({
    required this.id,
    required this.apiId,
    required this.name,
    required this.shortName,
    required this.logo,
    required this.score,
    required this.shirt,
    required this.isDefaultShirt,
    required this.national,
  });
  @override
  List<Object?> get props => [
        id,
        apiId,
        name,
        shortName,
        logo,
        score,
        shirt,
        isDefaultShirt,
        national,
      ];
}
