import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

var formKey = GlobalKey<FormState>();
  //courseCodeController.Text = courseOldData["title"];
var courseNameController = TextEditingController();
var courseArabicNameController = TextEditingController();
var courseHoursController = TextEditingController();
var courseDegreeController = TextEditingController();
var lecturerIDController = TextEditingController();
List<String> menueCategory = ['GEN', 'CSC', 'ISC', 'MAT', 'UNI', 'SEN'];
String? selectedCategory = menueCategory[0];

class UpdateCourse extends StatefulWidget {
  UpdateCourse(this.token, this.courseOldData);
  final token;
  final Map<String, dynamic> courseOldData;

  @override
  State<UpdateCourse> createState() => _UpdateCourseState();
}

class _UpdateCourseState extends State<UpdateCourse> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {
          if (state is UpdateCoursesSuccessState) {
            showToast("Updated successfully", ToastStates.Success);
            courseNameController.clear();
            courseArabicNameController.clear();
            courseHoursController.clear();
            courseDegreeController.clear();
            lecturerIDController.clear();
            selectedCategory = menueCategory[0];
          } else if (state is UpdateCoursesErrorState) {
            showToast(state.error, ToastStates.Error);
          }
        }, builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'إضافة مادة' : 'Update course',
                style: isArabic
                    ? arTitleStyle(
                        color: defaultColor, size: 20, weight: FontWeight.w600)
                    : titleStyle(
                        color: defaultColor, size: 20, weight: FontWeight.w600),
              ),
              backgroundColor: defaultBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultBackgroundColor,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Container(
                    color: defaultBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            heightSpace(),
                            /*Text(
                              isArabic
                                  ? 'أدخل كود المادة :'
                                  : 'Enter course code:',
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
                            defaultTextField(
                              textEditingController: courseCodeController,
                              textInputType: TextInputType.text,
                              preIcon: Icons.qr_code,
                              validator: (courseCodeController) {
                                if (courseCodeController.toString().isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الكود!'
                                      : 'Please enter the code!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),*/
                            Text(
                              isArabic
                                  ? 'أدخل اسم المادة :'
                                  : 'Course name (English):',
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
                            defaultTextField(
                              labelText: widget. courseOldData["title"],
                              textEditingController: courseNameController,
                              textInputType: TextInputType.name,
                              preIcon: Icons.account_tree_outlined,
                              validator: (courseNameController) {
                                if (courseNameController.toString().isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الاسم!'
                                      : 'Please enter the name!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              isArabic
                                  ? 'أدخل اسم المادة :'
                                  : 'Course name (Arabic):',
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
                            defaultTextField(
                              labelText: widget. courseOldData["titleArb"],
                              textEditingController: courseArabicNameController,
                              textInputType: TextInputType.name,
                              preIcon: Icons.account_tree,
                              validator: (courseArabicNameController) {
                                if (courseArabicNameController
                                    .toString()
                                    .isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الاسم!'
                                      : 'Please enter the name!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              isArabic
                                  ? 'اختر فئة المادة:'
                                  : 'Category of the course:',
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
                            DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                value: selectedCategory,
                                items: menueCategory
                                    .map((category) => DropdownMenuItem<String>(
                                          value: category,
                                          child: Text(category),
                                        ))
                                    .toList(),
                                onChanged: (category) => setState(() {
                                      selectedCategory = category;
                                    })),
                            heightSpace(),
                            heightSpace(),
                            /*Text(
                              isArabic
                                  ? 'اختر مستوى المادة:'
                                  : 'Choose the level of the course:',
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
                            DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide:
                                            BorderSide(color: Colors.grey))),
                                value: selectedLevel,
                                items: menueLevels
                                    .map((level) => DropdownMenuItem<String>(
                                          value: level,
                                          child: Text(level),
                                        ))
                                    .toList(),
                                onChanged: (level) => setState(() {
                                      selectedLevel = level;
                                    })),
                            heightSpace(),
                            heightSpace(),*/
                            Text(
                              isArabic
                                  ? 'أدخل اسم المحاضر :'
                                  : 'Total hours of the course:',
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
                            defaultTextField(
                              labelText: widget. courseOldData["numOfHours"],
                              textEditingController: courseHoursController,
                              textInputType: TextInputType.number,
                              preIcon: Icons.access_time_rounded,
                              validator: (courseHoursController) {
                                if (courseHoursController.toString().isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الاسم!'
                                      : 'Please enter the hours!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              isArabic
                                  ? 'أدخل اسم المحاضر :'
                                  : 'Total degrees of the course:',
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
                            defaultTextField(
                              labelText: widget. courseOldData["grade"],
                              textEditingController: courseDegreeController,
                              textInputType: TextInputType.number,
                              preIcon: Icons.bar_chart_outlined,
                              validator: (courseDegreeController) {
                                if (courseDegreeController.toString().isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الاسم!'
                                      : 'Please enter the degree!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              isArabic ? 'أدخل اسم المحاضر :' : 'Lecturer ID:',
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
                            defaultTextField(
                              textEditingController: lecturerIDController,
                              textInputType: TextInputType.text,
                              preIcon: Icons.person_outline,
                              validator: (lecturerIDController) {
                                if (lecturerIDController.toString().isEmpty) {
                                  return isArabic
                                      ? 'من فضلك أدخل الاسم!'
                                      : 'Please enter the ID!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            heightSpace(),
                            defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  print('Updating course');
                                  cubit.updateCourse(
                                      widget.token,
                                      widget.courseOldData["courseId"],
                                      courseNameController.text,
                                      courseArabicNameController.text,
                                      selectedCategory!,
                                      widget.courseOldData["level"],
                                      int.parse(courseHoursController.text),
                                      int.parse(courseDegreeController.text),
                                      lecturerIDController.text);
                                }
                              },
                              text: isArabic ? 'إضافة' : 'Update',
                            ),
                            heightSpace(),
                            heightSpace(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
