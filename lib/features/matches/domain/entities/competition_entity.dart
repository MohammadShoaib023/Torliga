import 'package:equatable/equatable.dart';

class CompetitionEntity extends Equatable {
  final String id;
  final String apiId;
  final String name;
  final String logo;

  const CompetitionEntity({
    required this.id,
    required this.apiId,
    required this.name,
    required this.logo,
  });

  @override
  List<Object?> get props => [id, apiId, name, logo];
}
