// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../setting_screens/phone.dart';

class SettingAdminScreen extends StatelessWidget {
  SettingAdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'اعدادات النظام' : 'System Settings',
                style: isArabic
                    ? arTitleStyle(
                        size: 20, color: Colors.white, weight: FontWeight.w600)
                    : titleStyle(
                        color: Colors.white, size: 24, weight: FontWeight.w600),
              ),
              automaticallyImplyLeading: false,
            ),
            //backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                color: defaultBackgroundColor,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      adminSectionName(
                          isArabic ? 'عملية التوصية' : 'Recommendation Process',
                          Icons.manage_search_sharp),
                      heightSpace(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ToggleSwitch(
                            totalSwitches: 2,
                            labels: const ['Off', 'On'],
                            fontSize: 18,
                            activeBgColors: [
                              [Colors.red.shade300],
                              [Colors.green.shade300]
                            ],
                            inactiveBgColor: Colors.grey,
                            activeFgColor: Colors.black,
                            inactiveFgColor: Colors.black,
                            cornerRadius: 10,
                            //icons: const [
                            //  Icons.search_off_rounded,
                            //  Icons.search_rounded
                            //],
                            initialLabelIndex: 0,
                            minWidth: 100,
                            minHeight: 50,
                            onToggle: (index) {
                              print('switched to $index ');
                            },
                          ),
                        ],
                      ),
                      heightSpace(),
                      //heightSpace(),
                      //Container(
                      //  height: 0.5,
                      // color: Colors.grey,
                      //),
                      heightSpace(),
                      adminSectionName(isArabic ? 'المرشدين' : 'Advisors',
                          Icons.account_circle_outlined),
                      settingItem(
                          const Icon(Icons.person_add),
                          isArabic ? 'اضافة مرشد جديد' : 'Add new advisor',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.edit),
                          isArabic ? 'تعديل مرشد' : 'Edit advisor',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.person_off),
                          isArabic ? 'حذف مرشد' : 'Remove advisor',
                          context,
                          const PhoneScreen()),
                      //adminButton(Icons.person_add, 'Add new advisor'),
                      //adminButton(Icons.edit, 'Edit current advisor'),
                      //adminButton(Icons.person_off, 'Remove advisor'),
                      heightSpace(),
                      adminSectionName(isArabic ? 'المواد' : 'Courses',
                          Icons.account_tree_outlined),
                      settingItem(
                          const Icon(Icons.add_card_rounded),
                          isArabic ? 'اضافة مادة جديدة' : 'Add new course',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.edit_note_rounded),
                          isArabic ? 'تعديل مادة حالية' : 'Edit current course',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.delete),
                          isArabic ? 'حذف مادة' : 'Remove course',
                          context,
                          const PhoneScreen()),
                      heightSpace(),
                      adminSectionName(isArabic ? 'الطلاب' : 'Students',
                          Icons.account_box_outlined),
                      settingItem(
                          const Icon(Icons.person_add),
                          isArabic ? 'اضافة طالب جديد' : 'Add new student',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.edit),
                          isArabic ? 'تعديل طالب' : 'Edit student',
                          context,
                          const PhoneScreen()),
                      settingItem(
                          const Icon(Icons.person_off),
                          isArabic ? 'حذف طالب' : 'Remove student',
                          context,
                          const PhoneScreen()),
                      heightSpace(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
