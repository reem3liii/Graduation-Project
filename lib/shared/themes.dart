import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/colors.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: defaultBackgroundColor,
  fontFamily: 'regIBM',
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
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

//ThemeData darkTheme = ThemeData(
//  primarySwatch: Colors.teal,
//  scaffoldBackgroundColor: defaultDarkBackgroundColor,
// appBarTheme: AppBarTheme(
//    titleSpacing: 20,
    //backwardsCompatibility: false,
//    systemOverlayStyle: const SystemUiOverlayStyle(
//      statusBarColor: defaultDarkBackgroundColor,
//      statusBarIconBrightness: Brightness.light,
//    ),
//    backgroundColor: defaultDarkBackgroundColor,
//    elevation: 0,
//    titleTextStyle: TextStyle(
//      color: defaultLightColor,
//      fontWeight: FontWeight.bold,
//      fontSize: 20,
//    ),
//    iconTheme: IconThemeData(
//      color: defaultLightColor,
//    ),
//  ),
//  bottomNavigationBarTheme: BottomNavigationBarThemeData(
//    type: BottomNavigationBarType.fixed,
//    unselectedItemColor: Colors.grey,
//    selectedItemColor: defaultLightColor,
//    elevation: 20,
//    backgroundColor: defaultDarkBackgroundColor,
//  ),
//  textTheme: TextTheme(
//    bodyText1: TextStyle(
//      fontSize: 18,
//      fontWeight: FontWeight.w600,
//      color: defaultLightColor,
//    ),
//  ),
//);
