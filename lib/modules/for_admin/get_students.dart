import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';
import '../../modules/for_admin/insert_degrees.dart';

int selectedIndex = -1;

class GetStudents extends StatefulWidget {
  const GetStudents({Key? key, required this.students, required this.token})
      : super(key: key);
  final List<dynamic> students;
  final String token;

  @override
  State<GetStudents> createState() => _GetStudentsState();
}

class _GetStudentsState extends State<GetStudents> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is CurrentCoursesForAdminSuccessState) {
            navigateTo(
                context,
                InsertDegrees(
                  currentCourses: state.responce,
                  studentId: widget.students[selectedIndex]['id'],
                  token: widget.token,
                ));
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'The Students',
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
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ConditionalBuilder(
                      builder: (BuildContext context) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
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
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    widthSpace(),
                                    SizedBox(
                                      width: 270,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          heightSpace(),
                                          Text(
                                            '  ${widget.students[index]['fullName']}',
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: defaultColor,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  'ID: ${widget.students[index]['id']}\nLevel: ${widget.students[index]['level']}\nEmail: ${widget.students[index]['email']}\nPhone:  ${widget.students[index]['phone']}',
                                                  style: bodyStyle2(size: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*const Spacer(),
                                  IconButton(
                                      iconSize: 22,
                                      onPressed: () {
                                        deleteDialog(context, (){},(){});
                                      },
                                      icon: Icon(
                                        Icons.cancel_rounded,
                                        color: Colors.red.shade700,
                                      )),*/
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          selectedIndex = index;
                                          cubit.getCurrentCoursesForAdmin(
                                              widget.token,
                                              widget.students[index]['id']);
                                        },
                                        child: Text(
                                          'Insert degrees',
                                          style: titleStyle(
                                              color: defaultColor, size: 15),
                                        )),
                                  ],
                                ),
                                //heightSpace(),
                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                          itemCount: widget.students.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: height / 50,
                          ),
                        );
                      },
                      condition: widget.students.isNotEmpty,
                      fallback: (BuildContext context) {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                            'assets/images/noCourses.png',
                            width: width/1.5,
                          ),
                              Text(
                                "There are no students in this level.\nPlease add new ones!",
                                style: bodyStyle3(
                                size: 18,
                                //color: defaultColor,
                                weight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
