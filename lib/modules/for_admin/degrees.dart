import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';
import 'package:saas/shared/design/colors.dart';

import 'insert_degrees.dart';

var arrayOfVisible =
    List<bool>.generate(int.parse(data[5].toString()), (i) => false);

class Degrees extends StatefulWidget {
  const Degrees({Key? key}) : super(key: key);

  @override
  State<Degrees> createState() => _DegreesState();
}

class _DegreesState extends State<Degrees> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int standard = 2;

    //AppCubit cubitDegrees = AppCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'تقرير الدرجات' : 'Degrees report',
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
            //backgroundColor: Colors.grey.shade100,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
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
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width / 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: GestureDetector(
                                              child: Text(
                                                semesters[index]
                                                    .keys
                                                    .toList()
                                                    .first,
                                                style: titleStyle(
                                                  size: width / 15,
                                                  color: defaultColor,
                                                ),
                                                //TextStyle(fontSize: 25, color: defaultColor),
                                              ),
                                              onTap: () {
                                                //cubitDegrees.visible(index);
                                                setState(() {
                                                  arrayOfVisible[index] =
                                                      !arrayOfVisible[index];
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '   GPA',
                                              style: titleStyle(
                                                size: width / 30,
                                                //color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height / 200,
                                            ),
                                            Stack(
                                              children: [
                                                LinearPercentIndicator(
                                                  width: width / 2,
                                                  animation: true,
                                                  animationDuration: 750,
                                                  lineHeight: height / 35,
                                                  percent: semesters[index]
                                                          .values
                                                          .last
                                                          .toDouble() /
                                                      4,
                                                  progressColor:
                                                      semesters[index]
                                                                  .values
                                                                  .last
                                                                  .toDouble() >
                                                              standard
                                                          ? defaultGreenColor
                                                              .shade300
                                                          : Colors.red.shade400,
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                  barRadius:
                                                      const Radius.circular(12),
                                                  curve: Curves.easeInOut,
                                                ),
                                                Positioned(
                                                  top: 1,
                                                  left: 14,
                                                  child: Text(
                                                    semesters[index]
                                                        .values
                                                        .last
                                                        .toString(),
                                                    style: bodyStyle(
                                                      size: width / 30,
                                                      weight: FontWeight.w600,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ],
                                    ),
                                    Visibility(
                                      visible: arrayOfVisible[index],
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 20),
                                        child: Column(
                                          children: [
                                            ListView.separated(
                                                physics: const ScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder: (context, sub) =>
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            isArabic
                                                                ? arSubjects[
                                                                            index]
                                                                        .keys
                                                                        .toList()[
                                                                    sub]
                                                                : subjects[
                                                                        index]
                                                                    .keys
                                                                    .toList()[sub],
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                          Text(
                                                            subjects[
                                                                    index][subjects[
                                                                        index]
                                                                    .keys
                                                                    .toList()[sub]]
                                                                .toString(),
                                                            style: bodyStyle(
                                                                size: 16,
                                                                weight:
                                                                    FontWeight
                                                                        .w600,
                                                                color: double.parse(subjects[index][subjects[index].keys.toList()[sub]]
                                                                            .toString()) >
                                                                        standard
                                                                    ? Colors
                                                                        .green
                                                                    : Colors
                                                                        .red),
                                                          ),
                                                        ]),
                                                separatorBuilder: (context,
                                                        sub) =>
                                                    const SizedBox(height: 10),
                                                itemCount:
                                                    subjects[index].length)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              ),
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: height / 50,
                            ),
                        itemCount: int.parse(data[5].toString())),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Insert the degrees of\nthe current semester?',
                    style: titleStyle(size: 18),
                  ),
                  heightSpace(),
                  heightSpace(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 75),
                    child: defaultButton(
                      function: () {
                        setState(() {
                          navigateTo(context, const InsertDegrees());
                        });
                      },
                      text: isArabic ? 'ادخال' : 'INSERT',
                    ),
                  ),
                  heightSpace(),
                  heightSpace(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
