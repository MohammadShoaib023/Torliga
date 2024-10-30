import 'package:go_router/go_router.dart';

import '../../features/matches/presentation/screens/matches_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const MatchesScreen(),
      )
    ],
  );
}
