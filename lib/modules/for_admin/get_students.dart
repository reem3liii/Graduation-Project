import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';
import 'degrees.dart';

class GetStudents extends StatefulWidget {
  GetStudents({Key? key, required this.students}) : super(key: key);
  final List<dynamic> students;

  @override
  State<GetStudents> createState() => _GetStudentsState();
}

class _GetStudentsState extends State<GetStudents> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  isArabic ? 'الطلاب' : 'The Students',
                  style: isArabic
                      ? arTitleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600)
                      : titleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600),
                ),
                backgroundColor: defaultBackgroundColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultBackgroundColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
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
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  widthSpace(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        '  ${widget.students[index]['fullName']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: defaultColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              'ID: ${widget.students[index]['id']}\nLevel: ${widget.students[index]['level']}\nEmail: ${widget.students[index]['email']}\nPhone:  ${widget.students[index]['phone']}',
                                              style: bodyStyle2(size: 16),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          iconSize: 22,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.cancel_rounded,
                                            color: Colors.red.shade700,
                                          )),
                                      IconButton(
                                          iconSize: 22,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: defaultColor,
                                          )),
                                    ],
                                  ),
                                  widthSpace(),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        setState(() {
                                          navigateTo(context, const Degrees());
                                        });
                                      },
                                      child: Text(
                                        'View degrees',
                                        style: titleStyle(
                                            color: defaultColor, size: 15),
                                      )),
                                ],
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                      itemCount: widget.students.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: height / 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
