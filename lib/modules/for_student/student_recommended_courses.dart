import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/json_models.dart';

import '../../main.dart';

class StudentRecommendedCourses extends StatelessWidget {
  const StudentRecommendedCourses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is RegisterRecCoursesForStudentSuccessState) {
            if (state.regRecCoursesForStudent.status.toString() == "Success") {
              print(state.regRecCoursesForStudent.message.toString());
              showToast(state.regRecCoursesForStudent.message.toString(), ToastStates.Success);

            }else if(state.regRecCoursesForStudent.status == "Fail"){
              print(state.regRecCoursesForStudent.status.toString());
              showToast(state.regRecCoursesForStudent.message.toString(), ToastStates.Error);

            }
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                isArabic ? 'المواد الموصى بها' : 'Your Recommended Courses',
                style: isArabic
                    ? arTitleStyle(
                    color: Colors.white, size: 20, weight: FontWeight.w600)
                    : AppBarTheme.of(context).titleTextStyle,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        right: 15,
                      ),
                      child: ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsetsDirectional.only(
                            bottom: 12,
                          ),
                          child: Container(
                            height: height / 7,
                            width: width,
                            decoration: BoxDecoration(
                              color: MyApp.themeNotifier.value == ThemeMode.light?
                              Colors.white.withOpacity(0.85)
                                  :
                              Colors.grey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Text(
                                      createCourseAbbreviation(recCoursesForStudent[index]),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30.0,
                                          color: Colors.green),
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.green.withOpacity(0.2),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                  ),
                                  const SizedBox(width: 20,),
                                  //const Spacer(),
                                  SizedBox(
                                    width: width/2,
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            recCoursesForStudent[index],
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          const SizedBox(height: 8,),
                                          Row(
                                            children: [
                                              const Icon(Icons.watch_later_outlined,color: Colors.grey,size: 17,),
                                              const SizedBox(width: 10,),
                                              Text(
                                                '${coursesHours(recCoursesForStudent[index]).toString()} credits',
                                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        itemCount: recCoursesForStudent.length,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ConditionalBuilder(
                      condition: state is! RegisterRecCoursesForStudentLoadingState,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: defaultButton(
                            function: (){
                              cubit.postRegisterRecCoursesForStudent(token, recCoursesForStudent);
                            },
                            text: 'REGISTER'
                        ),
                      ),
                      fallback: (context) => const Center(child: CircularProgressIndicator(),),
                    ),

                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}
