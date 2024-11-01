import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/matches/presentation/bloc/matches_bloc.dart';
import 'app_injection_container.dart' as di;

class AppBlocProviders {
  static get init => [
        BlocProvider(create: (_) => di.sl<MatchesBloc>()),
      ];
}
