import 'package:get_it/get_it.dart';

import '../core/network/network_info.dart';
import '../core/services/api_service.dart';
import '../features/matches/data/datasource/remote/matches_remote_datasource.dart';
import '../features/matches/data/repository_imp/matches_repository_impl.dart';
import '../features/matches/domain/repository/matches_repository.dart';
import '../features/matches/domain/usecases/fetch_past_matches_use_case.dart';
import '../features/matches/domain/usecases/fetch_todays_matches_use_case.dart';
import '../features/matches/domain/usecases/fetch_upcoming_matches_use_case.dart';
import '../features/matches/presentation/bloc/matches_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<ApiService>(() => ApiService());

  core();
  dataSources();
  repositories();
  useCases();
  blocs();
}

void core() {
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void dataSources() {
  sl.registerFactory<MatchesRemoteDatasource>(
      () => MatchesRemoteDatesourceImpl(sl(), sl()));
}

void repositories() {
  //MatchesRepository
  sl.registerFactory<MatchesRepository>(() => MatchesRepositoryImpl(sl()));
}

void useCases() {
  sl.registerLazySingleton(() => FetchPastMatchesUseCase(sl()));
  sl.registerLazySingleton(() => FetchTodaysMatchesUseCase(sl()));
  sl.registerLazySingleton(() => FetchUpcomingMatchesUseCase(sl()));
}

void blocs() {
  sl.registerLazySingleton<MatchesBloc>(() => MatchesBloc(sl(), sl(), sl()));
}
