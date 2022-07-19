import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/json_models.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';
import 'get_students.dart';

var formKey = GlobalKey<FormState>();
List<int> menueLevels = [1, 2, 3, 4];
int selectedLevel = menueLevels[0];

class SelectStudentLevel extends StatefulWidget {
  const SelectStudentLevel({Key? key, required this.token}) : super(key: key);

  final String token;

  @override
  State<SelectStudentLevel> createState() => _SelectStudentLevelState();
}

class _SelectStudentLevelState extends State<SelectStudentLevel> {
  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is GetStudentsSuccessState) {     
             navigateTo(context, GetStudents(students: state.students, token: token,));
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'The Students',
                  style: titleStyle(
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
                                'Choose the level of students you want to list:',
                                style: bodyStyle3(
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
                                  value: selectedLevel.toString(),
                                  items: menueLevels
                                      .map((level) => DropdownMenuItem<String>(
                                            value: level.toString(),
                                            child: Text(
                                                'Level ${level.toString()}'),
                                          ))
                                      .toList(),
                                  onChanged: (level) => setState(() {
                                        selectedLevel = int.parse(level!);
                                      })),
                              heightSpace(),
                              heightSpace(),
                              heightSpace(),
                              heightSpace(),
                              ConditionalBuilder(
                                condition: state is! GetStudentsLoadingState,
                                builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    print('selecting level $selectedLevel');
                                    cubit.allStudents(
                                        widget.token, selectedLevel);
                                  }
                                },
                                text:'List',
                              ),
                                fallback: (context) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
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
