import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';
import 'get_students.dart';

var formKey = GlobalKey<FormState>();
List<String> menueLevels = ['Level 1', 'Level 2', 'Level 3', 'Level 4'];
String? selectedLevel = menueLevels[0];

class SelectStudentLevel extends StatefulWidget {
  const SelectStudentLevel({Key? key}) : super(key: key);

  @override
  State<SelectStudentLevel> createState() => _SelectStudentLevelState();
}

class _SelectStudentLevelState extends State<SelectStudentLevel> {
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
                  isArabic ? 'الطلاب' : 'The Students',
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
                                    ? 'اختر مستوى الطلاب الذي تود عرضه:'
                                    : 'Choose the level of students you want to list:',
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
                                          borderSide: const BorderSide(
                                              color: Colors.grey))),
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
                              heightSpace(),
                              defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    print('selecting the level');
                                    navigateTo(context, const GetStudents());
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
