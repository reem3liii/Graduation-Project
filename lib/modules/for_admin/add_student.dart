import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

var formKey = GlobalKey<FormState>();
var studentIDController = TextEditingController();
var studentNameController = TextEditingController();
var studentArabicNameController = TextEditingController();
var studentBODController = TextEditingController();
var studentPhoneController = TextEditingController();
var studentCityController = TextEditingController();
var studentAddressController = TextEditingController();
List<String> menueGender = ['   Male', '    Female'];
String? selectedGender = menueGender[0];
var studentPQController = TextEditingController();
var studentInstituteController = TextEditingController();
var studentTotalPrevDegreeController = TextEditingController();
var studentPrecentagePrevDegreeController = TextEditingController();
var studentAccYearController = TextEditingController();
var studentGradYearController = TextEditingController();
var studentEmailController = TextEditingController();
var studentPasswordController = TextEditingController();
//List<String> menueLevels = ['1', '2', '3', '4'];
//String? selectedLevel = menueLevels[0];
List<String> menueSemesters = ['    1', '   2', '   3', '   4', '   5', '   6', '   7', '   8'];
String? selectedSemester = menueSemesters[0];
List<String> menueDepartment = ['   SWE', '   BIO', '   CS', '    IS', '    IT'];
String? selectedDepartment = menueDepartment[0];

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'إضافة طالب' : 'Add student',
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
                        isArabic
                            ? 'أدخل رقم تعريف الطالب :'
                            : 'Enter student SSN:',
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
                        textEditingController: studentIDController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.badge_outlined,
                        validator: (studentIDController) {
                          if (studentIDController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل الرقم!'
                                : 'Please enter the SSN!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل اسم الطالب :'
                            : 'Enter student name (English):',
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
                        textEditingController: studentNameController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.perm_identity_rounded,
                        validator: (studentNameController) {
                          if (studentNameController.toString().isEmpty) {
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
                            ? 'أدخل اسم الطالب :'
                            : 'Enter student name (Arabic):',
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
                        textEditingController: studentArabicNameController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.person_rounded,
                        validator: (studentArabicNameController) {
                          if (studentArabicNameController.toString().isEmpty) {
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
                            ? 'اختر المستوى المسؤول عنه المرشد :'
                            : 'Choose the gender of the student:',
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
                                      const BorderSide(color: Colors.grey))),
                          value: selectedGender,
                          items: menueGender
                              .map((gender) => DropdownMenuItem<String>(
                                    value: gender,
                                    child: Text(gender),
                                  ))
                              .toList(),
                          onChanged: (gender) => setState(() {
                                selectedGender = gender;
                              })),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل اسم المرشد :'
                            : 'Enter student birth of date:',
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
                        textEditingController: studentBODController,
                        textInputType: TextInputType.datetime,
                        preIcon: Icons.calendar_month_rounded,
                        validator: (studentBODController) {
                          if (studentBODController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل الاسم!'
                                : 'Please enter the date!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل رقم الهاتف الخاص بالطالب :'
                            : 'Enter student phone number :',
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
                        textEditingController: studentPhoneController,
                        textInputType: TextInputType.phone,
                        preIcon: Icons.phone,
                        validator: (studentPhoneController) {
                          if (studentPhoneController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل رقم الهاتف!'
                                : 'Please enter phone number!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student city:',
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
                        textEditingController: studentCityController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.location_city_rounded,
                        validator: (studentCityController) {
                          if (studentCityController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the city!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student address:',
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
                        textEditingController: studentAddressController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.location_on_rounded,
                        validator: (studentAddressController) {
                          if (studentAddressController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the address!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student previous qualification:',
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
                        textEditingController: studentPQController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.assignment_outlined,
                        validator: (studentPQController) {
                          if (studentPQController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the previous qualification!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student previous institute:',
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
                        textEditingController: studentInstituteController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.business_outlined,
                        validator: (studentInstituteController) {
                          if (studentInstituteController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the previous institute!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student previous total degree:',
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
                        textEditingController: studentTotalPrevDegreeController,
                        textInputType: TextInputType.number,
                        preIcon: Icons.bar_chart_outlined,
                        validator: (studentTotalPrevDegreeController) {
                          if (studentTotalPrevDegreeController
                              .toString()
                              .isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the previous total degree!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter the precentage of the previous total degree:',
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
                        textEditingController:
                            studentPrecentagePrevDegreeController,
                        textInputType: TextInputType.number,
                        preIcon: Icons.percent_outlined,
                        validator: (studentPrecentagePrevDegreeController) {
                          if (studentPrecentagePrevDegreeController
                              .toString()
                              .isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the precentage!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter the acceptence year of the student:',
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
                        textEditingController: studentAccYearController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.check_circle_rounded,
                        validator: (studentAccYearController) {
                          if (studentAccYearController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the acceptence year!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter the expected graduation year of the student:',
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
                        textEditingController: studentGradYearController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.celebration_rounded,
                        validator: (studentGradYearController) {
                          if (studentGradYearController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the expected graduation year!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      /*heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'اختر مستوى الطالب:'
                            : 'Choose the level of the student:',
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
                                      const BorderSide(color: Colors.grey))),
                          value: selectedLevel,
                          items: menueLevels
                              .map((level) => DropdownMenuItem<String>(
                                    value: level,
                                    child: Text(level),
                                  ))
                              .toList(),
                          onChanged: (level) => setState(() {
                                selectedLevel = level;
                              })),*/
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'اختر مستوى الطالب:'
                            : 'Choose the semester of the student:',
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
                                      const BorderSide(color: Colors.grey))),
                          value: selectedSemester,
                          items: menueSemesters
                              .map((semester) => DropdownMenuItem<String>(
                                    value: semester,
                                    child: Text(semester),
                                  ))
                              .toList(),
                          onChanged: (semester) => setState(() {
                                selectedSemester = semester;
                              })),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'اختر مستوى الطالب:'
                            : 'Choose the department of the student:',
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
                                      const BorderSide(color: Colors.grey))),
                          value: selectedDepartment,
                          items: menueDepartment
                              .map((department) => DropdownMenuItem<String>(
                                    value: department,
                                    child: Text(department),
                                  ))
                              .toList(),
                          onChanged: (department) => setState(() {
                                selectedDepartment = department;
                              })),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student e-mail:',
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
                        textEditingController: studentEmailController,
                        textInputType: TextInputType.emailAddress,
                        preIcon: Icons.email_rounded,
                        validator: (studentEmailController) {
                          if (studentEmailController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the email!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter temporary password:',
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
                        textEditingController: studentPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        preIcon: Icons.lock_rounded,
                        validator: (studentPasswordController) {
                          if (studentPasswordController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل البريد الالكتروني!'
                                : 'Please enter the password!';
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
                            print('Adding new student');
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
