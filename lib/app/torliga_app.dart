import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../config/router/app_router.dart';
import '../core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_bloc_providers.dart';

class TorligaApp extends StatelessWidget {
  const TorligaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.init,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        title: AppConstants.appName,
        theme: ThemeData(textTheme: GoogleFonts.chakraPetchTextTheme()),
      ),
    );
  }
}
