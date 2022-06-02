import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
//import 'package:saas/shared/models.dart';
//import 'package:saas/shared/components.dart';
//import 'package:saas/shared/colors.dart';
import 'package:saas/shared/items/models.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                  courses[index],
                  height: height / 5.75,
                  width: width,
                  color: AppCubit.get(context).isLightTheme
                      ? Colors.white.withOpacity(0.7)
                      : Colors.black.withOpacity(0.4),
                  titleColor: AppCubit.get(context).isLightTheme
                      ? Colors.black
                      : Colors.white,
                  context: context,
                ),
                itemCount: courses.length,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
