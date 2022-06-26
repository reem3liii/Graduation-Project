import 'package:flutter/material.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/items/models.dart';
import 'package:saas/shared/items/components.dart';

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
                  color: MyApp.themeNotifier.value == ThemeMode.light?
                  Colors.white.withOpacity(0.85)
                      :
                  Colors.grey.withOpacity(0.15),

                  titleColor: MyApp.themeNotifier.value == ThemeMode.light
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
