import 'package:flutter/material.dart';
import 'package:saas/models/models.dart';
import 'package:saas/shared/components/components.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PerformanceData> data = [
      PerformanceData('1st', 3.1),
      PerformanceData('2nd', 2.2),
      PerformanceData('3rd', 3.1),
      PerformanceData('4th', 2.7),
      PerformanceData('5th', 2.9),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15,top: 8,bottom: 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Image.asset('assets/images/student_profile.png',),
          ),
        ),
        title: const Text(
          'Hi, Rahma Elsayed 👋',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                '  Performance',
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),
              ),
              heightSpace(),
              SizedBox(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries<PerformanceData, String>>[
                        LineSeries<PerformanceData, String>(
                            dataSource: data,
                            xValueMapper: (PerformanceData gpa, _) => gpa.semester,
                            yValueMapper: (PerformanceData gpa, _) => gpa.gpa,
                            name: 'GPA',
                            dataLabelSettings: DataLabelSettings(isVisible: true)
                        ),
                      ]),
                ),
              ),
              heightSpace(),
              Row(
                children:[
                  containerWithShadow(
                    Widget: defaultCircularPercentIndicator(
                      titleText: 'Total GPA',
                      value: '3.1',
                      color: Colors.green.shade500,
                      percentValue: 0.76,
                    ),
                  ),
                  widthSpace(),
                  widthSpace(),
                  containerWithShadow(
                    Widget: defaultCircularPercentIndicator(
                      titleText: 'Total Hours',
                      value: '80',
                      color: Colors.blue.shade700,
                      percentValue: 0.606,
                    ),
                  ),
                ],
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),
      ),
    );
  }
}