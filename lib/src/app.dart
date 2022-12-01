import 'package:dokter/src/core/config/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'core/assets/assets.gen.dart';
import 'core/config/theme_colors.dart';
import 'presentation/views/settings/settings_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    precacheImage(AssetImage(Assets.logo.logoWhite.path), context);
  }

  @override
  Widget build(BuildContext context) {
    final themeData = ThemeData(primarySwatch: ThemeColors.green);
    final textTheme = GoogleFonts.poppinsTextTheme(themeData.textTheme);
    final poppins = GoogleFonts.poppins();
    final theme = themeData.copyWith(
      textTheme: textTheme,
      scaffoldBackgroundColor: Colors.white,
      disabledColor: ThemeColors.grey5,
      appBarTheme: themeData.appBarTheme.copyWith(
        centerTitle: true,
        elevation: 0.0,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return Theme.of(context).disabledColor;
            }
            return Colors.white;
          }),
          visualDensity: const VisualDensity(vertical: 2),
          textStyle: MaterialStateProperty.all(TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: poppins.fontFamily,
          )),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          visualDensity: const VisualDensity(vertical: 2),
          side: MaterialStateProperty.all(
            BorderSide(
              color: themeData.primaryColor,
              width: 2,
            ),
          ),
        ),
      ),
    );

    final settingsController = context.read<SettingsController>();

    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'blitar-sehat-dokter',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          debugShowCheckedModeBanner: false,
          theme: theme,
          themeMode: settingsController.themeMode,
          onGenerateRoute: AppRoute.onGenerateRoute,
        );
      },
    );
  }
}
