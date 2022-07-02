import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

var formKey = GlobalKey<FormState>();
var courseCodeController = TextEditingController();
var courseNameController = TextEditingController();
var courseArabicNameController = TextEditingController();
var courseHoursController = TextEditingController();
var courseDegreeController = TextEditingController();
//var courseLevelController = TextEditingController();
//var courseCategoryController = TextEditingController();
var lecturerIDController = TextEditingController();
List<String> menueCategory = ['   GEN', '   CSC', '   ISC', '   MAT', '   UNI', '   SEN'];
String? selectedCategory = menueCategory[0];
List<String> menueLevels = ['   1', '   2', '   3', '   4'];
String? selectedLevel = menueLevels[0];

class AddCourse extends StatefulWidget {
  const AddCourse({Key? key}) : super(key: key);

  @override
  State<AddCourse> createState() => _AddCourseState();
}

class _AddCourseState extends State<AddCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'إضافة مادة' : 'Add course',
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
                      Text(
                        isArabic ? 'أدخل كود المادة :' : 'Enter course code :',
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
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل اسم المادة :'
                            : 'Enter course name (English):',
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
                            : 'Enter course name (Arabic):',
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
                        textEditingController: courseArabicNameController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.account_tree,
                        validator: (courseArabicNameController) {
                          if (courseArabicNameController.toString().isEmpty) {
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
                            : 'Choose the category of the course:',
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
                                  borderSide: BorderSide(color: Colors.grey))),
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
                      Text(
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
                                  borderSide: BorderSide(color: Colors.grey))),
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
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل اسم المحاضر :'
                            : 'Enter total hours of the course:',
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
                            : 'Enter total degrees of the course:',
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
                        isArabic ? 'أدخل اسم المحاضر :' : 'Enter lecturer ID :',
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
                            print('Adding new course');
                          }
                        },
                        text: isArabic ? 'إضافة' : 'Add',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
