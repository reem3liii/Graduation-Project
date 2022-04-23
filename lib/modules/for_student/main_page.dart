import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';

import 'details.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          AppCubit cubitScreens = AppCubit.get(context);
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedLabelStyle:
                isArabic ? arTitleStyle(size: 10) : titleStyle(size: 12),
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
                currentIndex: cubitScreens.selectedIndex,
                onTap: (index){
                  cubitScreens.changeIndex(index);
                },
              ),
              body: cubitScreens.screens[cubitScreens.selectedIndex]);
        },
      ),
    );
  }


}

