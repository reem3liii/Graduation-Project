import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/design/colors.dart';

import '../items/components.dart';

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
      color: Colors.white,
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
    bodyText1: titleStyle(
      color: Colors.black,
      size: 20,
      weight: FontWeight.w600,
    ),
    bodyText2: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
      height: 1.25,
      color: Colors.black,
      //letterSpacing: -0.5,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.blueGrey,
  scaffoldBackgroundColor: defaultDarkBackgroundColor,
  fontFamily: 'regIBM',
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
    bodyText1: titleStyle(
      color: Colors.white,
      size: 20,
      weight: FontWeight.w600,
    ),
    bodyText2: const TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 13.0,
      height: 1.25,
      color: Colors.white,
      //letterSpacing: -0.5,
    ),
    /* */
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
