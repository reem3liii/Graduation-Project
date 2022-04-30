import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/modules/setting_screens/phone.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../login_screen.dart';
import '../setting_screens/app_info.dart';
import 'admin_profile_screen.dart';

class MainAdminScreen extends StatelessWidget {
  const MainAdminScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubitAdminScreens = AppCubit.get(context);
          return Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: true,
                showUnselectedLabels: false,
                selectedLabelStyle:
                    isArabic ? arTitleStyle(size: 10) : titleStyle(size: 12),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_outlined, size: width / 15),
                      label: isArabic ? 'الصفحة الرئيسية' : 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined, size: width / 15),
                      label: isArabic ? 'الضبط' : 'Settings'),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person_outline_rounded,
                      size: width / 15,
                    ),
                    label: isArabic ? 'الصفحة الشخصية' : 'Profile',
                  ),
                ],
                currentIndex: cubitAdminScreens.selectedAdminIndex,
                onTap: (index) {
                  cubitAdminScreens.changeAdminIndex(index);
                },
              ),
              body: cubitAdminScreens
                  .adminScreens[cubitAdminScreens.selectedAdminIndex]);
        },
      ),
    );
  }
}
