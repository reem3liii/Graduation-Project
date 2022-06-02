import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

var formKey = GlobalKey<FormState>();
var studentIDController = TextEditingController();
var studentNameController = TextEditingController();
var studentEmailController = TextEditingController();
var studentLevelController = TextEditingController();
var studentPhoneController = TextEditingController();

List<String> menueLevels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];
String? selectedLevel = menueLevels[0];

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
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل رقم تعريف الطالب :'
                            : 'Enter student ID :',
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
                        preIcon: Icons.perm_contact_cal_sharp,
                        validator: (studentIDController) {
                          if (studentIDController.toString().isEmpty) {
                            return isArabic
                                ? 'من فضلك أدخل الرقم!'
                                : 'Please enter the ID!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic ? 'أدخل اسم الطالب :' : 'Enter student name :',
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
                            ? 'أدخل البريد الالكتروني الخاص بالطالب :'
                            : 'Enter student e-mail :',
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
                              })),
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
