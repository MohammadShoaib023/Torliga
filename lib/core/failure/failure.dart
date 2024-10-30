import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ServerErrorFailure extends Failure {
  const ServerErrorFailure(super.message);
}

class InternetDisconnectedFailure extends Failure {
  const InternetDisconnectedFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class ServiceCategoryFailure extends Failure {
  const ServiceCategoryFailure(super.message);
}
