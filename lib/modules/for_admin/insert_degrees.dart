import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

List<Map> courses = [];
var controllers = [
  controller1,
  controller2,
  controller3,
  controller4,
  controller5,
  controller6,
  controller7,
  controller8
];
var controller1 = TextEditingController();
var controller2 = TextEditingController();
var controller3 = TextEditingController();
var controller4 = TextEditingController();
var controller5 = TextEditingController();
var controller6 = TextEditingController();
var controller7 = TextEditingController();
var controller8 = TextEditingController();

class InsertDegrees extends StatefulWidget {
  const InsertDegrees(
      {Key? key,
      required this.currentCourses,
      required this.token,
      required this.studentId})
      : super(key: key);
  final dynamic currentCourses;
  final String token;
  final String studentId;

  @override
  State<InsertDegrees> createState() => _InsertDegreesState();
}

class _InsertDegreesState extends State<InsertDegrees> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is InsertDegreesSuccessState) {
            controller1.clear();
            controller2.clear();
            controller3.clear();
            controller4.clear();
            controller5.clear();
            controller6.clear();
            controller7.clear();
            controller8.clear();
            showToast(state.responce['message'], ToastStates.Success);
          } else if (state is InsertDegreesErrorState) {
            showToast(state.error, ToastStates.Error);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Insert degrees',
                style: titleStyle(
                    color: defaultColor, size: 20, weight: FontWeight.w600),
              ),
              backgroundColor: defaultBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultBackgroundColor,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  heightSpace(),
                  heightSpace(),
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 0,
                                    offset: Offset(0.2, 0.2),
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.currentCourses[index]
                                              ['courseName'],
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: defaultColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          widget.currentCourses[index]
                                              ['courseCode'],
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  widthSpace(),
                                  Expanded(
                                    child: TextField(
                                      controller: controllers[index],
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: defaultColor)),
                                        labelText: "GPA",
                                        counterText: "",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: height / 50,
                          ),
                      itemCount: widget.currentCourses.length),
                  heightSpace(),
                  heightSpace(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ConditionalBuilder(
                      builder: (BuildContext context) {
                        return defaultButton(
                          function: () {
                            for (int i = 0;
                                i < widget.currentCourses.length;
                                i++) {
                              courses.add({
                                'grade': double.parse(controllers[i].text),
                                'courseId': widget.currentCourses[i]
                                    ['courseCode']
                              });
                            }
                            cubit.insetDegrees(
                                widget.token, widget.studentId, courses);
                          },
                          text: 'Save',
                        );
                      },
                      condition: state != InsertDegreesLoadingState(),
                      fallback: (BuildContext context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                  heightSpace(),
                  heightSpace(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
