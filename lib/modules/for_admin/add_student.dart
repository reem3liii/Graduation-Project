import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

var formKey = GlobalKey<FormState>();
var studentIDController = TextEditingController();
var studentNameController = TextEditingController();
var studentArabicNameController = TextEditingController();
var studentBODController = TextEditingController();
var studentPhoneController = TextEditingController();
var studentCityController = TextEditingController();
var studentAddressController = TextEditingController();
List<String> menueGender = ['Male', 'Female'];
String selectedGender = menueGender[0];
var studentPQController = TextEditingController();
var studentInstituteController = TextEditingController();
var studentTotalPrevDegreeController = TextEditingController();
var studentPrecentagePrevDegreeController = TextEditingController();
var studentAccYearController = TextEditingController();
var studentGradYearController = TextEditingController();
var studentEmailController = TextEditingController();
var studentPasswordController = TextEditingController();
List<String> menueSemesters = ['1', '2', '3', '4', '5', '6', '7', '8'];
String selectedSemester = menueSemesters[0];
List<String> menueDepartment = ['SWE', 'BIO', 'CS', 'IS', 'IT'];
String selectedDepartment = menueDepartment[0];

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit(),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (BuildContext context, AppStates state) {
          if (state is AddStudentSuccessState) {
              showToast(state.addResponse.message!, ToastStates.Success);
              studentIDController.clear();
              studentNameController.clear();
              studentArabicNameController.clear();
              studentEmailController.clear();
              studentPasswordController.clear();
              studentPhoneController.clear();
              studentBODController.clear();
              selectedGender = menueGender[0];
              selectedSemester = menueSemesters[0];
              selectedDepartment = menueDepartment[0];
              studentCityController.clear();
              studentAddressController.clear();
              studentInstituteController.clear();
              studentTotalPrevDegreeController.clear();
              studentPrecentagePrevDegreeController.clear();
              studentAccYearController.clear();
              studentGradYearController.clear();
              studentBODController.clear();
          } else if (state is AddStudentErrorState) {
            showToast(state.error, ToastStates.Error);
          }
        }, builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Add student',
                style: titleStyle(
                        color: defaultColor, size: 20, weight: FontWeight.w600),
              ),
              backgroundColor: defaultBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultBackgroundColor,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
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
                              'Enter student SSN:',
                              style: bodyStyle3(
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
                                  return 'Please enter the SSN!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student name (English):',
                              style: bodyStyle3(
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
                                  return 'Please enter the name!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student name (Arabic):',
                              style: bodyStyle3(
                                      size: 16,
                                      color: defaultColor,
                                      weight: FontWeight.bold),
                            ),
                            heightSpace(),
                            defaultTextField(
                              textEditingController:
                                  studentArabicNameController,
                              textInputType: TextInputType.name,
                              preIcon: Icons.person_rounded,
                              validator: (studentArabicNameController) {
                                if (studentArabicNameController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the name!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Choose the gender of the student:',
                              style: bodyStyle3(
                                      size: 16,
                                      color: defaultColor,
                                      weight: FontWeight.bold),
                            ),
                            heightSpace(),
                            DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                                value: selectedGender,
                                items: menueGender
                                    .map((gender) => DropdownMenuItem<String>(
                                          value: gender,
                                          child: Text(gender),
                                        ))
                                    .toList(),
                                onChanged: (gender) => setState(() {
                                      selectedGender = gender!;
                                    })),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student birth of date (in this style yyyy-mm-dd):',
                              style: bodyStyle3(
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
                                  return 'Please enter the date!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Enter student phone number :',
                              style:  bodyStyle3(
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
                                  return 'Please enter phone number!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                               'Enter student city:',
                              style: bodyStyle3(
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
                                  return 'Please enter the city!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student address:',
                              style: bodyStyle3(
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
                                if (studentAddressController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the address!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student previous qualification:',
                              style: bodyStyle3(
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
                                  return 'Please enter the previous qualification!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student previous institute:',
                              style: bodyStyle3(
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
                                if (studentInstituteController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the previous institute!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Enter student previous total degree:',
                              style: bodyStyle3(
                                      size: 16,
                                      color: defaultColor,
                                      weight: FontWeight.bold),
                            ),
                            heightSpace(),
                            defaultTextField(
                              textEditingController:
                                  studentTotalPrevDegreeController,
                              textInputType: TextInputType.number,
                              preIcon: Icons.bar_chart_outlined,
                              validator: (studentTotalPrevDegreeController) {
                                if (studentTotalPrevDegreeController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the previous total degree!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Enter the precentage of the previous total degree:',
                              style: bodyStyle3(
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

                              validator:
                                  (studentPrecentagePrevDegreeController) {
                                if (studentPrecentagePrevDegreeController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the precentage!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                               'Enter the acceptence year of the student:',
                              style: bodyStyle3(
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
                                if (studentAccYearController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the acceptence year!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Enter the expected graduation year of the student:',
                              style: bodyStyle3(
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
                                if (studentGradYearController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the expected graduation year!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Choose the semester of the student:',
                              style: bodyStyle3(
                                      size: 16,
                                      color: defaultColor,
                                      weight: FontWeight.bold),
                            ),
                            heightSpace(),
                            DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                                value: selectedSemester,
                                items: menueSemesters
                                    .map((semester) => DropdownMenuItem<String>(
                                          value: semester,
                                          child: Text(semester),
                                        ))
                                    .toList(),
                                onChanged: (semester) => setState(() {
                                      selectedSemester = semester!;
                                    })),
                            heightSpace(),
                            heightSpace(),
                            Text(
                             'Choose the department of the student:',
                              style: bodyStyle3(
                                      size: 16,
                                      color: defaultColor,
                                      weight: FontWeight.bold),
                            ),
                            heightSpace(),
                            DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.grey))),
                                value: selectedDepartment,
                                items: menueDepartment
                                    .map((department) =>
                                        DropdownMenuItem<String>(
                                          value: department,
                                          child: Text(department),
                                        ))
                                    .toList(),
                                onChanged: (department) => setState(() {
                                      selectedDepartment = department!;
                                    })),
                            heightSpace(),
                            heightSpace(),
                            Text(
                              'Enter student e-mail:',
                              style: bodyStyle3(
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
                                  return 'Please enter the email!';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            Text(
                               'Enter temporary password:',
                              style:  bodyStyle3(
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
                                if (studentPasswordController
                                    .toString()
                                    .isEmpty) {
                                  return 'Please enter the password!';
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
                                  print('Adding new student . . .');
                                  cubit.AddStudent(
                                      widget.token,
                                      studentIDController.text,
                                      studentNameController.text,
                                      studentArabicNameController.text,
                                      selectedGender,
                                      studentBODController.text,
                                      studentPhoneController.text,
                                      int.parse(selectedSemester),
                                      studentCityController.text,
                                      studentAddressController.text,
                                      studentPQController.text,
                                      studentInstituteController.text,
                                      int.parse(studentGradYearController.text),
                                      studentAccYearController.text,
                                      selectedDepartment,
                                      int.parse(studentTotalPrevDegreeController
                                          .text),
                                      int.parse(
                                          studentPrecentagePrevDegreeController
                                              .text),
                                      studentEmailController.text,
                                      studentPasswordController.text);
                                }
                              },
                              text: 'Add',
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
