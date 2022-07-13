import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_admin/select_course_category.dart';
import 'package:saas/modules/for_admin/select_student_level.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../login_screen.dart';
import 'add_advisor.dart';
import 'add_student.dart';
import 'add_course.dart';
import 'get_advisors.dart';

class HomeAdminScreen extends StatelessWidget {
  const HomeAdminScreen(this.token, this.email);
  final token;
  final email;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is GetAdvisorsSuccessState) {
            navigateTo(context, GetAdvisors(state.advisors));
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: defaultColor,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
              child: AppBar(
                backgroundColor: defaultColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultColor,
                  statusBarIconBrightness: Brightness.light,
                ),
                automaticallyImplyLeading: false,
              ),
            ),
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
                          height: height / 18,
                        ),
                        Image.asset(
                          'assets/images/SAAS Logo 1.png',
                          width: width / 3,
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          "Ahmed Maher Ali",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white, fontSize: 26),
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          email,
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
                                [Colors.redAccent.shade700],
                                [Colors.greenAccent.shade700]
                              ],
                              inactiveBgColor: defaultBackgroundColor,
                              activeFgColor: Colors.white,
                              inactiveFgColor: Colors.grey.shade500,
                              borderColor: const [Colors.grey],
                              borderWidth: 0.7,
                              cornerRadius: 30,
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
                        settingItemAdmin(const Icon(Icons.list_rounded),
                            isArabic ? 'عرض المرشدين' : 'List current advisors',
                            () {
                          print("Get advisors . . . ");
                          print(token);
                          cubit.allAdvisors(token);
                        }),
                        settingItem(
                            const Icon(Icons.person_add),
                            isArabic ? 'اضافة مرشد جديد' : 'Add new advisor',
                            context,
                            AddAdvisor(token)),
                        heightSpace(),
                        adminSectionName(isArabic ? 'المواد' : 'Courses',
                            Icons.account_tree_outlined),
                        settingItem(
                            const Icon(Icons.list_rounded),
                            isArabic ? 'عرض المواد' : 'List all courses',
                            context,
                            SelectCourseCategory(
                              token: token,
                            )),
                        settingItem(
                          const Icon(Icons.add_chart_rounded),
                          isArabic ? 'اضافة مادة جديدة' : 'Add new course',
                          context,
                          AddCourse(token),
                        ),
                        heightSpace(),
                        adminSectionName(isArabic ? 'الطلاب' : 'Students',
                            Icons.account_box_outlined),
                        settingItem(
                            const Icon(Icons.list_rounded),
                            isArabic ? 'عرض الطلاب' : 'List students',
                            context,
                             SelectStudentLevel(token: token,)),
                        settingItem(
                            const Icon(Icons.person_add),
                            isArabic ? 'اضافة طالب جديد' : 'Add new student',
                            context,
                            AddStudent( token: token)),
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
