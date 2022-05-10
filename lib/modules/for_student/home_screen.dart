/*
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_student/recommended_courses.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/models.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List<PerformanceData> data = [
      PerformanceData('1st', 2.54),
      PerformanceData('2nd', 2.67),
      PerformanceData('3rd', 2.75),
      PerformanceData('4th', 2.78),
      PerformanceData('5th', 2.85),
    ];

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
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
                            plotAreaBorderWidth: 0,
                            primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                            ),
                            primaryYAxis: NumericAxis(
                              //labelFormat: '{value}',
                              //axisLine: AxisLine(width: 0),
                              majorGridLines: const MajorGridLines(width: 0),
                              majorTickLines: const MajorTickLines(size: 0),
                            ),
                            tooltipBehavior: TooltipBehavior(enable: true),
                            series: <ColumnSeries<PerformanceData, String>>[
                              ColumnSeries<PerformanceData, String>(
                                //series: <ChartSeries<PerformanceData, String>>[
                                //SplineAreaSeries<PerformanceData, String>(
                                //color: const Color.fromRGBO(75, 135, 185, 0.6),
                                //markerSettings: MarkerSettings(isVisible: true),
                                //borderColor: const Color.fromRGBO(75, 135, 185, 1),
                                //borderWidth: 2,
                                dataSource: data,
                                xValueMapper: (PerformanceData gpa, _) => gpa.semester,
                                yValueMapper: (PerformanceData gpa, _) => gpa.gpa,
                                name: 'GPA',
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  color: AppCubit.get(context).isLightTheme? Colors.white : Colors.black,
                                ),
                                opacity: 0.55,
                                //opacity: 0.3,
                                animationDuration: 2000,
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
                                value: '2.5',
                                color: Colors.green.shade500,
                                percentValue: 0.75,
                                titlecolor: AppCubit.get(context).isLightTheme? Colors.black : Colors.white,
                                backgroundcolor:
                                AppCubit.get(context).isLightTheme?
                                Colors.grey.shade100
                                    :
                                Colors.grey.shade700, context: context,
                              ),
                              height: height / 4.75,
                              color: AppCubit.get(context).isLightTheme?
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
                                value: '73',
                                color: Colors.blue.shade700,
                                percentValue: 0.553,
                                titlecolor: AppCubit.get(context).isLightTheme? Colors.black : Colors.white,
                                backgroundcolor: AppCubit.get(context).isLightTheme?
                                Colors.grey.shade100
                                    :
                                Colors.grey.shade700, context: context,
                              ),
                              height: height /4.75,
                              color: AppCubit.get(context).isLightTheme?
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
                      defaultGridViewList(
                        itembuild: (context, index) => coursesList(
                            courses[index],
                            height: height / 3,
                            color: AppCubit.get(context).isLightTheme?
                                Colors.white.withOpacity(0.98)
                                  :
                                Colors.black.withOpacity(0.8),
                            titleColor: AppCubit.get(context).isLightTheme? Colors.black : Colors.white, context: context,
                        ),
                        list: courses,
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

*/