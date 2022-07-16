import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

class GetStudents extends StatefulWidget {
  const GetStudents({Key? key, required this.students}) : super(key: key);
  final List<dynamic> students;

  @override
  State<GetStudents> createState() => _GetStudentsState();
}

class _GetStudentsState extends State<GetStudents> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'The Students',
                  style: titleStyle(
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
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
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
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widthSpace(),
                                SizedBox(
                                  width: 270,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      heightSpace(),
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
                                      ),
                                    ],
                                  ),
                                ),
                                /*const Spacer(),
                                IconButton(
                                    iconSize: 22,
                                    onPressed: () {
                                      deleteDialog(context, (){},(){});
                                    },
                                    icon: Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    )),*/
                                
                              ],
                            ),
                            /*Row(
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
                            ),*/
                            heightSpace(),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
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
