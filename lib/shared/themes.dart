import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/colors.dart';

import 'components.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: defaultBackgroundColor,
  fontFamily: 'regIBM',
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: defaultColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: defaultColor,
    elevation: 0,
    titleTextStyle: titleStyle(
      color: defaultColor,
      size: 20,
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

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: defaultDarkBackgroundColor,
 appBarTheme: AppBarTheme(
    titleSpacing: 20,
    //backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: darkPrimaryColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: darkPrimaryColor,
    elevation: 0,
    titleTextStyle: titleStyle(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    unselectedItemColor: Colors.grey,
    selectedItemColor: Colors.white,
    elevation: 20,
    backgroundColor: defaultDarkBackgroundColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: defaultLightColor,
    ),
  ),
);
