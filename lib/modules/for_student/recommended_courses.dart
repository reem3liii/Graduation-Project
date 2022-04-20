import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/models.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';

class RecommendedScreen extends StatelessWidget {
  const RecommendedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'المواد الموصى بها' : 'Recommended Courses',
          style: isArabic
              ? arTitleStyle(
                  color: defaultColor, size: 20, weight: FontWeight.w600)
              : titleStyle(
                  color: defaultColor, size: 20, weight: FontWeight.w600),
        ),
        backgroundColor: defaultBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView.builder(
          itemBuilder: (context, index) => recCoursesItem(courses[index]),
          itemCount: courses.length,
        ),
      ),
    );
  }
}
