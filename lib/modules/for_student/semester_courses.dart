import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/json_models.dart';

import '../../main.dart';

class showSemesterCourses extends StatelessWidget {
  showSemesterCourses(this.SemesterName);
  //List<CoursesOnSemester> courses_semester;
  String SemesterName;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int standard = 1;
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getCoursesOnSemester(token, SemesterName),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                SemesterName,
                style: AppBarTheme.of(context).titleTextStyle?.copyWith(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 20,
                    end: 20,
                    bottom: 30,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          top: 15,
                          start: 15,
                          end: 30,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: width/2,
                              child: Text('Courses',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color:
                                  MyApp.themeNotifier.value == ThemeMode.light?
                                  defaultColor
                                      :
                                  defaultLightColor,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Expanded(
                              child: Text('GPA',
                                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color:
                                  MyApp.themeNotifier.value == ThemeMode.light?
                                  defaultColor
                                      :
                                  defaultLightColor,
                                ),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: MyApp.themeNotifier.value == ThemeMode.light?
                          Colors.white
                              :
                          Colors.black.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 0,
                              offset: Offset(0.2, 0.2),
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: ListView.separated(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, sub) => SizedBox(
                              height: height/15,
                              child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: width/2,
                                      child: Text(
                                        //isArabic
                                        //? arSubjects[index].keys.toList()[sub]:
                                        courses_Semester[sub].courseName.toString(),
                                        maxLines: 2,
                                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: Text(
                                        courses_Semester[sub].gpa!.toStringAsFixed(1),
                                        style: bodyStyle(
                                            size: 18,
                                            weight: FontWeight.w600,
                                            color: courses_Semester[sub].gpa! >=
                                                standard
                                                ? Colors.green
                                                : Colors.red
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                            separatorBuilder: (context, sub) => Divider(
                              thickness: 1,
                              color:
                              MyApp.themeNotifier.value == ThemeMode.light?
                              Colors.grey[300]
                                  :
                              Colors.grey[800],
                            ),
                            itemCount: courses_Semester.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
