import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_student/student_recommended_courses.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/json_models.dart';
import 'package:saas/shared/items/components.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                isArabic ? 'المواد الموصى بها' : 'Recommended Courses',
                style: isArabic
                    ? arTitleStyle(
                    color: Colors.white, size: 20, weight: FontWeight.w600)
                    : AppBarTheme.of(context).titleTextStyle,
              ),
              actions: [
                IconButton(onPressed: (){
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Important Information",style: TextStyle(fontWeight: FontWeight.bold),),
                      content: Text("According to your GPA , you are allowed to choose courses  ${minHours.toString()} : ${maxHours.toString()} hours.\n"
                      'The courses are arranged in descending order of preference.'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: const Text("ok",style: TextStyle(color: Colors.green,fontSize: 20),),
                        ),
                      ],
                    ),
                  );
                }, icon: const Icon(Icons.info)),
              ],
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
                      itemBuilder: (context, index) => recCoursesItem(
                        recCourses[index],
                        height: height / 5.5,
                        width: width,
                        color: MyApp.themeNotifier.value == ThemeMode.light?
                        Colors.white.withOpacity(0.85)
                            :
                        Colors.grey.withOpacity(0.15),

                        titleColor: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        context: context,
                      ),
                      itemCount: recCourses.length,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                      bottom: 40,
                      start: 30,
                      end: 30,
                    ),
                    child: defaultButton(
                        function: (){
                          if(semesterHours < minHours){
                            showToast('Your Courses are not enough.Please Select more courses.', ToastStates.Error);
                          } else{
                            navigateTo(context, const StudentRecommendedCourses());
                          }
                        },
                        text: 'Continue'
                    ),
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
