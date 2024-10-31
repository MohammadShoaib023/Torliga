import 'package:go_router/go_router.dart';
import 'package:torliga/config/router/routes.dart';

import '../../features/matches/presentation/screens/matches_screen.dart';
import '../../features/splash/screen/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: '/',
    routes: [
      GoRoute(
        //TODO : Here put names routes
        // name:AppRoutes.splash,
        path: "/",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/matches",
        builder: (context, state) => const MatchesScreen(),
      )
    ],
  );
}
