import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

var formKey = GlobalKey<FormState>();
var advisorIDController = TextEditingController();
var advisorNameController = TextEditingController();
var advisorArabicNameController = TextEditingController();
var advisorEmailController = TextEditingController();
var advisorPasswordController = TextEditingController();
var advisorPhoneController = TextEditingController();
var advisorBODController = TextEditingController();
List<String> menueLevels = ['   1', '   2', '   3', '   4'];
String? selectedLevel = menueLevels[0];
List<String> menueGender = ['   Male', '    Female'];
String? selectedGender = menueGender[0];

class AddAdvisor extends StatefulWidget {
  const AddAdvisor({Key? key}) : super(key: key);

  @override
  State<AddAdvisor> createState() => _AddAdvisorState();
}

class _AddAdvisorState extends State<AddAdvisor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'إضافة مرشد' : 'Add advisor',
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
                            ? 'أدخل رقم تعريف المرشد :'
                            : 'Enter advisor SSN:',
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
                        textEditingController: advisorIDController,
                        textInputType: TextInputType.text,
                        preIcon: Icons.badge_outlined,
                        validator: (advisorIDController) {
                          if (advisorIDController.toString().isEmpty) {
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
                            ? 'أدخل اسم المرشد :'
                            : 'Enter advisor name (English):',
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
                        textEditingController: advisorNameController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.perm_identity_rounded,
                        validator: (advisorNameController) {
                          if (advisorNameController.toString().isEmpty) {
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
                            ? 'أدخل اسم المرشد :'
                            : 'Enter advisor name (Arabic):',
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
                        textEditingController: advisorArabicNameController,
                        textInputType: TextInputType.name,
                        preIcon: Icons.person,
                        validator: (advisorArabicNameController) {
                          if (advisorArabicNameController.toString().isEmpty) {
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
                            : 'Choose the gender of the advisor:',
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
                            : 'Enter advisor birth of date:',
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
                        textEditingController: advisorBODController,
                        textInputType: TextInputType.datetime,
                        preIcon: Icons.calendar_month_rounded,
                        validator: (advisorBODController) {
                          if (advisorBODController.toString().isEmpty) {
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
                            ? 'أدخل رقم الهاتف الخاص بالمرشد :'
                            : 'Enter advisor phone number :',
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
                        textEditingController: advisorPhoneController,
                        textInputType: TextInputType.phone,
                        preIcon: Icons.phone,
                        validator: (advisorPhoneController) {
                          if (advisorPhoneController.toString().isEmpty) {
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
                            ? 'اختر المستوى المسؤول عنه المرشد :'
                            : 'Choose the level which the advisor is responsible :',
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
                      Text(
                        isArabic
                            ? 'أدخل البريد الالكتروني الخاص بالمرشد :'
                            : 'Enter advisor e-mail:',
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
                        textEditingController: advisorEmailController,
                        textInputType: TextInputType.emailAddress,
                        preIcon: Icons.email_rounded,
                        validator: (advisorEmailController) {
                          if (advisorEmailController.toString().isEmpty) {
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
                            ? 'أدخل البريد الالكتروني الخاص بالمرشد :'
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
                        textEditingController: advisorPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        preIcon: Icons.lock_outline,
                        validator: (advisorPasswordController) {
                          if (advisorPasswordController.toString().isEmpty) {
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
                      heightSpace(),
                      defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            print('Adding new advisor');
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
