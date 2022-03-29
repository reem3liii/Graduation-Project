import 'package:flutter/material.dart';
import 'package:saas/modules/splash_screen.dart';
import 'package:saas/shared/styles/themes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter/services.dart';

bool isArabic = true;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: const Splash(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        isArabic ? const Locale('ar', 'AE') : const Locale('en', ''),
      ],
    );
  }
}
