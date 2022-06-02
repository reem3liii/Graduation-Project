import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_admin/select_course_category.dart';
import 'package:saas/modules/for_admin/select_student_level.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/data.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../login_screen.dart';
import 'add_advisor.dart';
import 'add_student.dart';
import 'add_course.dart';
import 'get_advisors.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen({Key? key}) : super(key: key);

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
            backgroundColor: defaultColor,
            //appBar: AppBar(),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: height / 2.3,
                    color: defaultColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: height / 15,
                        ),
                        Image.asset(
                          'assets/images/SAAS Logo 1.png',
                          width: width / 2.5,
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          isArabic
                              ? arData[arData.length - 2].toString()
                              : data[data.length - 2].toString(),
                          style: isArabic
                              ? arTitleStyle().copyWith(color: Colors.white)
                              : titleStyle().copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          isArabic
                              ? arData[arData.length - 1].toString()
                              : data[data.length - 1].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: lightDefaultColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: defaultBackgroundColor,
                        borderRadius: const BorderRadiusDirectional.only(
                          topStart: Radius.circular(35),
                          topEnd: Radius.circular(35),
                        )),
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        heightSpace(),
                        heightSpace(),
                        adminSectionName(
                            isArabic
                                ? 'عملية التوصية'
                                : 'Recommendation Process',
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
                                [Colors.red.shade400],
                                [Colors.green.shade400]
                              ],
                              inactiveBgColor: Colors.grey,
                              activeFgColor: Colors.black,
                              inactiveFgColor: Colors.black,
                              cornerRadius: 10,
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
                        heightSpace(),
                        adminSectionName(isArabic ? 'المرشدين' : 'Advisors',
                            Icons.account_circle_outlined),
                        settingItem(
                            const Icon(Icons.list_rounded),
                            isArabic ? 'عرض المرشدين' : 'List current advisors',
                            context,
                            const GetAdvisors()),
                        settingItem(
                            const Icon(Icons.person_add),
                            isArabic ? 'اضافة مرشد جديد' : 'Add new advisor',
                            context,
                            const AddAdvisor()),
                        heightSpace(),
                        adminSectionName(isArabic ? 'المواد' : 'Courses',
                            Icons.account_tree_outlined),
                        settingItem(
                            const Icon(Icons.list_rounded),
                            isArabic ? 'عرض المواد' : 'List all courses',
                            context,
                            const SelectCourseCategory()),
                        settingItem(
                            const Icon(Icons.add_card_rounded),
                            isArabic ? 'اضافة مادة جديدة' : 'Add new course',
                            context,
                            const AddCourse()),
                        heightSpace(),
                        adminSectionName(isArabic ? 'الطلاب' : 'Students',
                            Icons.account_box_outlined),
                        settingItem(
                            const Icon(Icons.list_rounded),
                            isArabic ? 'عرض الطلاب' : 'List students',
                            context,
                            const SelectStudentLevel()),
                        settingItem(
                            const Icon(Icons.person_add),
                            isArabic ? 'اضافة طالب جديد' : 'Add new student',
                            context,
                            const AddStudent()),
                        heightSpace(),
                        /*adminSectionName(isArabic ? 'الدرجات' : 'Degrees',
                            Icons.account_box_outlined),
                        settingItem(
                            const Icon(Icons.addchart_rounded),
                            isArabic ? 'ادخال الدرجات' : 'Insert degrees',
                            context,
                            const PhoneScreen()),
                        settingItem(
                            const Icon(Icons.edit_note_rounded),
                            isArabic ? 'تعديل الدرجات' : 'Edit degrees',
                            context,
                            const PhoneScreen()),*/
                        TextButton(
                          onPressed: () {
                            navigateToThenRemove(context, LoginScreen());
                            print('Logout');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.logout_rounded,
                                  color: defaultColor,
                                ),
                                widthSpace(),
                                Text(
                                  isArabic ? 'تسجيل الخروج' : 'LOGOUT',
                                  style: isArabic
                                      ? arTitleStyle(
                                          size: 20, color: defaultColor)
                                      : titleStyle(
                                          size: 20, color: defaultColor),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
