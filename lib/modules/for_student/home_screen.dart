import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_student/recommended_courses.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/json_models.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/shared/items/components.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(this.token);
  final token;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getTotalHoursAndGpa(token),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {

        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Image.asset(
                'assets/images/SAAS Logo 1.png',
                width: 50,
                height: 50,
              ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text(
                        isArabic ? 'أداؤك الأكاديمي' : 'Performance',
                        style: isArabic
                            ? arTitleStyle(
                          size: 20.0,
                        )
                            : Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: height / 120,
                      ),
                      SizedBox(
                        height: height / 3.5,
                        child: SfCartesianChart(
                            plotAreaBorderWidth: 1,
                            primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              //labelFormat: '{value}',
                              //axisLine: AxisLine(width: ),
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ColumnSeries<SemesterAndGrade, String>>[
                              ColumnSeries<SemesterAndGrade, String>(
                                //series: <ChartSeries<PerformanceData, String>>[
                                //SplineAreaSeries<PerformanceData, String>(
                                //color: const Color.fromRGBO(75, 135, 185, 0.6),
                                markerSettings: const MarkerSettings(isVisible: true),
                                //borderColor: const Color.fromRGBO(75, 135, 185, 1),
                                //borderWidth: 2,
                                dataSource: semestersAndGrades,
                                xValueMapper: (SemesterAndGrade gpa, _) => gpa.semesterName,
                                yValueMapper: (SemesterAndGrade gpa, _) => gpa.gpAofSemester,
                                name: 'GPA',
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  color: MyApp.themeNotifier.value == ThemeMode.light? Colors.white : Colors.black,
                                ),
                                opacity: 0.55,
                                //opacity: 0.3,
                                animationDuration: 1250,
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: height / 120,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: containerWithOROutShadow(
                              blurRadiusValue: 0,
                              offsetValue1: 0.2,
                              offsetValue2: 0.2,
                              widget: defaultCircularPercentIndicator(
                                height: height / 80,
                                radius: height / 15,
                                titleText: isArabic
                                    ? 'المعدل الأكاديمي التراكمي الكلي'
                                    : 'Total GPA',
                                value: totalGpa.toString(),
                                color: Colors.green.shade500,
                                percentValue: totalGpa/4,
                                titleColor: MyApp.themeNotifier.value == ThemeMode.light? Colors.black : Colors.white,
                                backgroundColor:
                                MyApp.themeNotifier.value == ThemeMode.light?
                                Colors.grey.shade100
                                    :
                                Colors.grey.shade700, context: context,
                              ),
                              height: height / 4.75,
                              color: MyApp.themeNotifier.value == ThemeMode.light?
                              Colors.white.withOpacity(0.98)
                                  :
                              Colors.black.withOpacity(0.8),
                            ),
                          ),
                          SizedBox(
                            width: width / 30,
                          ),
                          Expanded(
                            child: containerWithOROutShadow(
                              blurRadiusValue: 0,
                              offsetValue1: 0.2,
                              offsetValue2: 0.2,
                              widget: defaultCircularPercentIndicator(
                                height: height / 80,
                                radius: height / 15,
                                titleText: isArabic
                                    ? 'الساعات المعتمده الكليه'
                                    : 'Total Hours',
                                value: totalHours.toString(),
                                color: Colors.blue.shade700,
                                percentValue: totalHours/132,
                                titleColor: MyApp.themeNotifier.value == ThemeMode.light? Colors.black : Colors.white,
                                backgroundColor: MyApp.themeNotifier.value == ThemeMode.light?
                                Colors.grey.shade100
                                    :
                                Colors.grey.shade700, context: context,
                              ),
                              height: height /4.75,
                              color: MyApp.themeNotifier.value == ThemeMode.light?
                              Colors.white.withOpacity(0.98)
                                  :
                              Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Text(
                        isArabic ? 'المواد الحاليه' : 'Current Courses',
                        style: isArabic
                            ? arTitleStyle(
                          size: 20.0,
                        )
                            : Theme.of(context).textTheme.bodyText1,
                        //TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                      ),
                      SizedBox(
                        height: height / 100,
                      ),
                      ConditionalBuilder(
                        condition: currentCourses.isNotEmpty,
                        builder: (context) => defaultGridViewList(
                          itembuild: (context, index) => coursesList(
                            currentCourses[index],
                            height: height / 3,
                            color: MyApp.themeNotifier.value == ThemeMode.light?
                            Colors.white.withOpacity(0.98)
                                :
                            Colors.black.withOpacity(0.8),
                            titleColor: MyApp.themeNotifier.value == ThemeMode.light? Colors.black : Colors.white, context: context,
                          ),
                          list: currentCourses,
                        ),
                        fallback: (context) => Center(
                          child: Column(
                            children: [Image.asset(
                              'assets/images/noCourses.png',
                              width: width/1.75,
                              height: height/3.75,
                            ),
                              const Text('You do not have current courses now.',style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey,
                              ),),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: height / 30,
                      ),
                      Text(
                        isArabic ? 'المواد الموصى بها' : 'Recommended courses',
                        style: isArabic
                            ? arTitleStyle(
                          size: 20.0,
                        )
                            : Theme.of(context).textTheme.bodyText1,
                        //TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          defaultButton(
                            width: width / 1.3,
                            function: () {
                              navigateTo(context, const RecommendedScreen());
                            },
                            text: isArabic ? 'بدء التوصية' : 'Start recommendation',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 30,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}
