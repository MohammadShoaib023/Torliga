import 'package:flutter/material.dart';

import '../config/router/app_router.dart';
import '../core/constants/app_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class TorligaApp extends StatelessWidget {
  const TorligaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: AppConstants.appName,
      theme: ThemeData(textTheme: GoogleFonts.chakraPetchTextTheme()),
    );
  }
}
