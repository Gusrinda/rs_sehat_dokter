import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'src/app.dart';
import 'src/presentation/views/settings/settings_controller.dart';
import 'src/presentation/views/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final settingsController = SettingsController(SettingsService());

  await settingsController.loadSettings();

  // init localizations
  Intl.defaultLocale = 'id_ID';

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: settingsController),
    ],
    child: const MyApp(),
  ));
}
