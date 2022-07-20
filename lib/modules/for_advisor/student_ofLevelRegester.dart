import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_advisor/add_subject_screen.dart';
import 'package:saas/modules/for_advisor/studentDetails_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';

class studentsOfLevelRegester extends StatelessWidget {
  const studentsOfLevelRegester(
      {@required this.levelNumber, this.ListOfStudents, Key? key})
      : super(key: key);
  final levelNumber, ListOfStudents;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              backgroundColor: defaultColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: lightDefaultColor),
              title: Text(
                "level $levelNumber",
                style: titleStyle(
                  size: 20,
                  color: Colors.white,
                ),
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultColor,
                statusBarIconBrightness: Brightness.light,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: height / 15,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddSubjectScreen(
                                              levelNum: cubit.level,
                                              listOfSub: [],
                                              studentNum: 1,
                                              // AddSubjectScreen(
//                                             listOfSub: listOfSub,
//                                             studentNum: index,
//                                             levelNum: view,
//                                             )));
                                            )));
                              },
                              child: Row(
                                children: [
                                  Text(
                                    (index + 1).toString(),
                         style: TextStyle(color: defaultColor,fontSize: 20)

                                  ),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Text(
                                      ListOfStudents[index]['fullName']
                                          .toString(),
                                        style: TextStyle(color: defaultColor,fontSize: 20)
),
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
                    itemCount: ListOfStudents.length),
              ),
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
