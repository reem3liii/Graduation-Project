import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

List<String> deletedCourses = [];

class GetCourses extends StatelessWidget {
  GetCourses({Key? key, required this.coursesData, required this.token})
      : super(key: key);

  //final String coursesCategory;
  List<dynamic> coursesData;
  final String token;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          /*if (state is GetCourseByIDSuccessState) {
            navigateTo(context, UpdateCourse(token, state.courseByID));
          }*/
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'The Courses',
                  style:  titleStyle(
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
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.separated(
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 270,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  heightSpace(),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(
                                      '${coursesData[index]['courseName']}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: defaultColor,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Code: ${coursesData[index]['courseCode']}\nLevel: ${coursesData[index]['level']}\nLecturer: ${coursesData[index]['instructorName']}',
                                          style: bodyStyle2(size: 16),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            /*const Spacer(),
                            IconButton(
                                iconSize: 22,
                                onPressed: () {
                                  deleteDialog(context, () {
                                    deletedCourses
                                        .add(coursesData[index]['courseCode']);
                                    coursesData.removeAt(index);
                                    navigateTo(
                                        context,
                                        GetCourses(
                                            coursesData: coursesData,
                                            token: token));
                                  }, () {
                                    navigateTo(
                                        context,
                                        GetCourses(
                                            coursesData: coursesData,
                                            token: token));
                                  });
                                },
                                icon: Icon(
                                  Icons.cancel_rounded,
                                  color: Colors.red.shade700,
                                )),*/
                         
                          ],
                        ),
                      ),
                      itemCount: coursesData.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: height / 50,
                      ),
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
