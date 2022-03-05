import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/models/models.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<PerformanceData> data = [
      PerformanceData('1st', 2.54),
      PerformanceData('2nd', 2.67),
      PerformanceData('3rd', 2.75),
      PerformanceData('4th', 2.78),
      PerformanceData('5th', 2.85),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset('assets/images/SAAS Logo 1.png',),
            ),
          ),
        ),
        title: Text(
          'Hi, Student 👋',
          style: titleStyle(
            size: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15,top: 8,bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset('assets/images/student_profile.png',),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(14),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Text(
                  ' Performance',
                  style: titleStyle(
                      size: 18.0,
                  ),//TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                ),
                heightSpace(),
                SizedBox(
                  height: 160,
                  child: SfCartesianChart(
                        plotAreaBorderWidth: 0,
                        primaryXAxis: CategoryAxis(
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(size: 0),
                        ),
                        primaryYAxis: NumericAxis(
                            //labelFormat: '{value}',
                            //axisLine: AxisLine(width: 0),
                            majorGridLines: MajorGridLines(width: 0),
                            majorTickLines: MajorTickLines(size: 0),

                        ),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <ChartSeries<PerformanceData, String>>[
                          SplineAreaSeries<PerformanceData, String>(
                            //color: const Color.fromRGBO(75, 135, 185, 0.6),
                            //markerSettings: MarkerSettings(isVisible: true),
                            borderColor: const Color.fromRGBO(75, 135, 185, 1),
                            borderWidth: 2,
                            dataSource: data,
                            xValueMapper: (PerformanceData gpa, _) => gpa.semester,
                            yValueMapper: (PerformanceData gpa, _) => gpa.gpa,
                            name: 'GPA',
                            dataLabelSettings: DataLabelSettings(isVisible: true),
                            opacity: 0.3,
                            animationDuration: 2000,
                          ),
                        ]),
                ),
                heightSpace(),
                Row(
                  children:[
                    Expanded(
                      child: containerWithOROutShadow(
                        blurRadiusValue: 0,
                        offsetValue1: 0.2,
                        offsetValue2: 0.2,
                        widget: defaultCircularPercentIndicator(
                          titleText: 'Total GPA',
                          value: '2.5',
                          color: Colors.green.shade500,
                          percentValue: 0.75,
                        ),
                      ),
                    ),
                    widthSpace(),
                    Expanded(
                      child: containerWithOROutShadow(
                        blurRadiusValue: 0,
                        offsetValue1: 0.2,
                        offsetValue2: 0.2,
                        widget: defaultCircularPercentIndicator(
                          titleText: 'Total Hours',
                          value: '73',
                          color: Colors.blue.shade700,
                          percentValue: 0.553,
                        ),
                      ),
                    ),
                  ],
                ),
                heightSpace(),
                heightSpace(),
                Text(
                  '  Current Courses',
                  style: titleStyle(
                    size: 18.0,
                  ),//TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
                ),
                heightSpace(),
                defaultGridViewList(
                  itembuild: (context,index)=> coursesList(courses[index]),
                  list: courses,
                ),
                heightSpace(),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
    );
  }
}