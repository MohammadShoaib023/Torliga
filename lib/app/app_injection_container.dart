import 'package:get_it/get_it.dart';

import '../core/network/network_info.dart';
import '../core/services/api_service.dart';

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

void dataSources() {}
void repositories() {}
void useCases() {}
void blocs() {}
