import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_admin/insert_degrees.dart';
import 'package:saas/modules/for_advisor/courseDetails_screen.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:saas/main.dart';

class coursesScreen extends StatefulWidget {
  const coursesScreen({Key? key}) : super(key: key);

  @override
  State<coursesScreen> createState() => _coursesScreenState();
}

class _coursesScreenState extends State<coursesScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int standard = 2;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            //  backgroundColor: defaultColor,
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: defaultColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: lightDefaultColor),
              title: Text(
                'courses',
                style: titleStyle(
                  size: 20,
                  color: Colors.white,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultColor,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => GestureDetector(
                       onTap: () {
                                              //cubitDegrees.visible(index);
                                              setState(() {
                                                /*arrayOfVisible[index] =
                                                    !arrayOfVisible[index];*/
                                              });
                                            },
                      child: Container(
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          
                                          child: Text(
                                            cubit.categoryID[index],
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: titleStyle(
                                              size: width / 15,
                                              color: defaultColor,
                                            ),
                                            //TextStyle(fontSize: 25, color: defaultColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                    //visible: arrayOfVisible[index],
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          ListView.separated(
                                              physics: const ScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, sub) =>
                                                  GestureDetector(
                                                    onTap:()=> navigateTo(context,CourseDetails(
                    
                                                      chosenCourse: 
                                                            cubit
                                                                .categoryCourses[
                                                                    cubit
                                                                        .categoryID[
                                                                            index]
                                                                        .toString()]![
                                                                    sub],
                                                    ) ),
                                                    child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Flexible(
                                                            child: Text(
                                                              cubit
                                                                  .categoryCourses[
                                                                      cubit
                                                                          .categoryID[
                                                                              index]
                                                                          .toString()]![
                                                                      sub][
                                                                      "courseName"]
                                                                  .toString()
                                                              ,
                                                               overflow: TextOverflow.ellipsis,
                                                                              maxLines: 2,
                                                              style: const TextStyle(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Text(
                                                            cubit
                                                                .categoryCourses[
                                                                    cubit
                                                                        .categoryID[
                                                                            index]
                                                                        .toString()]![
                                                                    sub][
                                                                    "courseCode"]
                                                                .toString(),
                                                            style: bodyStyle(
                                                                size: 16,
                                                                weight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: Colors
                                                                    .green),
                                                          ),
                                                        ]),
                                                  ),
                                              separatorBuilder: (context,
                                                      sub) =>
                                                   SizedBox(height: height/35),
                                              itemCount: cubit
                                                  .categoryCourses[cubit
                                                      .categoryID[index]
                                                      .toString()]!
                                                  .length)
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                                crossAxisAlignment: CrossAxisAlignment.start,
                              ),
                            ),
                          ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: height / 50,
                        ),
                    itemCount: cubit.categoryID.length),
              ),
            ),
          );
        },
        listener: (BuildContext context, AppStates state) {},
      ),
    );
  }
}
