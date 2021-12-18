import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/styles/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: defaultBackgroundColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    //backwardsCompatibility: false,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: defaultBackgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: defaultBackgroundColor,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: defaultColor,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: defaultColor,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: defaultColor,
    elevation: 20,
    backgroundColor: defaultBackgroundColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: defaultColor,
    ),
  ),
);
