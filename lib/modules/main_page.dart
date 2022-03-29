import 'package:flutter/material.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

import 'details.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final screens = [
    HomeScreen(),
    const Details(),
    GPACalculator(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedLabelStyle: titleStyle(size: 12),
          selectedItemColor: defaultColor,
          backgroundColor: Colors.grey.shade100,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: width / 15),
                label: isArabic ? 'الصفحة الرئيسية' : 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart, size: width / 15),
                label: isArabic ? 'الدرجات' : 'Degrees'),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate, size: width / 15),
                label: isArabic ? 'حساب المعدل' : 'Calculator'),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: width / 15,
              ),
              label: isArabic ? 'الصفحة الشخصية' : 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped,
        ),
        body: screens[selectedIndex]);
  }
}
