import 'package:flutter/material.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';

import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';


class AddSubjectScreen extends StatefulWidget {
  final listOfSub, levelNum, studentNum;
  const AddSubjectScreen(
      {Key? key,
      required this.listOfSub,
      required this.levelNum,
      required this.studentNum})
      : super(key: key);

  @override
  State<AddSubjectScreen> createState() => _AddSubjectScreenState();
}

class _AddSubjectScreenState extends State<AddSubjectScreen> {
  var subjectController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var showlist = false, hideList = false, buttonBool = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showlist
              ? Expanded(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('save'),
                    style: ElevatedButton.styleFrom(primary: defaultColor),
                  ),
                ))
              : SizedBox(),
          FloatingActionButton(
            backgroundColor: defaultColor,
            onPressed: () {
              // setState(() {
              //   // var x =
              //   //   widget.listOfSub[widget.levelNum - 1][widget.studentNum]['subjects'];
              //   widget.listOfSub.add('st');

              //   print(widget.listOfSub);
              // });
              // BottomSheet(builder: (context) => Text('data'),onClosing: () => print('object'),);

              showModalBottomSheet(
                  // isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) => buildSheet(context));
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          buttonBool
              ? Center(
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          buttonBool = false;
                          widget.listOfSub.isEmpty
                              ? hideList = true
                              : showlist = true;
                        });
                      },
                      child: const Text('show saved subjects list')),
                )
              : const SizedBox(),
          hideList
              ? Center(
                  child: Column(
                  children: [
                    const Text('no list find'),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, GPACalculator());
                        },
                        child: const Text('use recommendation system?'))
                  ],
                ))
              : const SizedBox(),
          showlist
              ? ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          height: height / 15,
                          child: GestureDetector(
                            // onTap: () => Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => addSubjectScreen()))
                            //  () {

                            //   // levels[view - 1][index]['sbjects']
                            //   //     .add('test');
                            //   // var x =
                            //   //     levels[view - 1][index]['subjects'];
                            //   // // print(x);
                            //   // x.add('st');
                            //   // print(x);
                            //   //   for (var ep in x) {
                            //   //     print(ep);
                            //   //   }
                            //   // print(x);
                            // }

                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    widget.listOfSub[index].toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: defaultColor,
                                            fontWeight: FontWeight.normal),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      // widget.listOfSub
                                      //     .delete(widget.listOfSub[index]);
                                      widget.listOfSub.removeAt(index);
                                    });
                                  },
                                  icon: const Icon(Icons.cancel_rounded),
                                  color: Colors.red,
                                )
                                // SizedBox(
                                //   width: width / 30,
                                // ),
                                // Text(levels[widget.levelNum][index]['name'].toString(),
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .bodyText1!
                                //         .copyWith(
                                //             color: defaultColor,
                                //             fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Divider(
                        color: defaultColor,
                        indent: width / 20,
                        endIndent: width / 20,
                        thickness: 1,
                      ),
                  itemCount: widget.listOfSub.length)
              : const SizedBox(),
        ],
      ),
    );
  }

  Widget buildSheet(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            defaultTextField(
              textEditingController: subjectController,
              textInputType: TextInputType.name,
              preIcon: Icons.add,
              validator: (subjectController) {
                if (subjectController.toString().isEmpty) {
                  return 'subject Field is Empty!';
                }
                return null;
              },
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     border: OutlineInputBorder(),
            //     hintText: 'Enter subject name',
            //   ),
            // ),
            SizedBox(
              height: height / 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: defaultColor),
                    onPressed: () {
                      print(subjectController.text);
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          widget.listOfSub
                              .add(subjectController.text.toString());
                          hideList = false;
                          buttonBool = false;
                          showlist = true;
                          subjectController.clear();
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: const Text('done')),
                SizedBox(
                  width: width / 10,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.grey[300],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      print('object');
                    },
                    child: Text(
                      'cancel',
                      style: TextStyle(color: defaultColor),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}


/*
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_list/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:to_do_list/modules/done_tasks/done_tasks_screen.dart';
import 'package:to_do_list/modules/new_tasks/new_tasks_screen.dart';
import 'package:to_do_list/shared/components/components.dart';
import 'package:to_do_list/shared/components/constants.dart';
import 'package:to_do_list/shared/cubit/cubit.dart';
import 'package:to_do_list/shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..createDataBase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseStates) Navigator.pop(context);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              elevation: 3,
                backgroundColor: Colors.white,
                title: Text(
                  cubit.titles[cubit.currentIndex],
                  style: TextStyle(color: Colors.pink, fontSize: 25),
                )),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isBottomSheetShown) {
                  if (formKey.currentState.validate()) {
                    cubit.insertToDataBase(
                        title: titleController.text,
                        time: timeController.text,
                        date: dateController.text);
                  }
                } else {
                  scaffoldKey.currentState
                      .showBottomSheet(
                        (context) => Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                defaultFormField(
                                  controller: titleController,
                                  prefix: Icons.title,
                                  label: 'task title',
                                  type: TextInputType.text,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'title must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: timeController,
                                  prefix: Icons.watch_later_outlined,
                                  label: 'task time',

                                  type: TextInputType.datetime,

                                  onTap: () {
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) {
                                      timeController.text =
                                          value.format(context).toString();
                                      print(value.format(context));
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'time must not be empty';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultFormField(
                                  controller: dateController,
                                  prefix: Icons.calendar_today,
                                  label: 'task date',
                                  type: TextInputType.datetime,
                                  onTap: () {
                                    showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse('2021-09-27'))
                                        .then((value) {
                                      print(DateFormat.yMMMd().format(value));
                                      dateController.text =
                                          DateFormat.yMMMd().format(value);
                                    });
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'date must not be empty';
                                    }
                                    return null;
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        elevation: 10.0,
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        isShow: false, icon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              elevation: 10,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppGetDatabaseLoadingStates,
              builder: (context) => cubit.screens[cubit.currentIndex],
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          );
        },
      ),
    );
  }

}
*/