import 'package:flutter/material.dart';
import 'app/app_injection_container.dart';
import 'app/torliga_app.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(const TorligaApp());
}
