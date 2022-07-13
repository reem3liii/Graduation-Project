import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_admin/get_courses.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

var formKey = GlobalKey<FormState>();
List<String> menueCategory = ['SEN', 'CSC', 'ISC', 'MAT', 'GEN', 'UNI'];
String selectedCategory = menueCategory[0];

class SelectCourseCategory extends StatefulWidget {
  const SelectCourseCategory({Key? key, required this.token}) : super(key: key);
  final String token;

  @override
  State<SelectCourseCategory> createState() => _SelectCourseCategoryState();
}

class _SelectCourseCategoryState extends State<SelectCourseCategory> {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is GetCoursesSuccessState) {     
              navigateTo(context, GetCourses(coursesData: state.courses, token: widget.token,));
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  isArabic ? 'المواد' : 'The Courses',
                  style: isArabic
                      ? arTitleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600)
                      : titleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600),
                ),
                backgroundColor: defaultBackgroundColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultBackgroundColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              body: CustomScrollView(
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      color: defaultBackgroundColor,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              heightSpace(),
                              Text(
                                isArabic
                                    ? 'اختر فئة المواد التي تود عرضها:'
                                    : 'Choose the category of the courses you want to list:',
                                style: isArabic
                                    ? arBodyStyle(
                                        size: 16,
                                        color: defaultColor,
                                        weight: FontWeight.bold)
                                    : bodyStyle3(
                                        size: 16,
                                        color: defaultColor,
                                        weight: FontWeight.bold),
                              ),
                              heightSpace(),
                              heightSpace(),
                              DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              const BorderSide(color: Colors.grey))),
                                  value: selectedCategory,
                                  items: menueCategory
                                      .map((category) =>
                                          DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(category),
                                          ))
                                      .toList(),
                                  onChanged: (category) => setState(() {
                                        selectedCategory = category!;
                                      })),
                              heightSpace(),
                              heightSpace(),
                              heightSpace(),
                              heightSpace(),
                              defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    print(
                                        'selecting $selectedCategory Category');
                                    cubit.allCourses(
                                        widget.token, selectedCategory);
                                  }
                                },
                                text: isArabic ? 'عرض' : 'List',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
