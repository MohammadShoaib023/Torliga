import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static final AppColors _instance = AppColors._();
  static AppColors get instance => _instance;

  static const Color scaffoldColor = Color(0xff1E2224);
  static const Color primaryColor = Color(0xff86F14D);
  static const Color secondaryColor = Color(0xffE6FF48);
  static const Color cardColor = Color(0xff43484C);
}
