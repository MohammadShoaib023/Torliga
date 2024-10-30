import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../failure/failure.dart';

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call({required Params params});
}

abstract class UseCase<Type, Params> {
  call(Params params);
}

abstract class UseCaseList<Type, Params> {
  Future<Either<Failure, List<Type>>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final dynamic param;

  const Params({required this.param});

  @override
  List<Object> get props => [param];
}
