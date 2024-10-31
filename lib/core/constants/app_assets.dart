import 'package:flutter/material.dart';

class AppAssets {
  AppAssets._();

  static final AppAssets _instance = AppAssets._();
  static AppAssets get instance => _instance;

  static const String splash = "assets/jpg/splash.jpeg";
  static const String spain = "assets/svg/spain.svg";
  static const String one = "assets/svg/one.svg";
  static const String two = "assets/svg/two.svg";
}
