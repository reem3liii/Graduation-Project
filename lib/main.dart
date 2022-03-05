import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'modules/onboarding_screen.dart';
import 'package:saas/shared/styles/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    );
  }
}
