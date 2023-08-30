import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:plantasia/modules/screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plantasia',
      theme: ThemeData(
        fontFamily: 'Mulish',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 38, 58, 41),
          primary: const Color.fromARGB(255, 38, 58, 41),
          onPrimary: const Color.fromARGB(255, 242, 227, 219),
          secondary: const Color.fromARGB(255, 65, 100, 74),
          onSecondary: Colors.white,
        ),
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Dashboard(
        title: 'Plantasia',
      ),
    );
  }
}
