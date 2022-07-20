import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_advisor/studentDetails_screen.dart';
import 'package:saas/modules/for_advisor/students_ofLevel-_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/studentNamesList.dart';

class LevelScreen extends StatelessWidget {
  LevelScreen(this.token, this.email, {Key? key}) : super(key: key);
  final token;
  final email;
  var dropDownValue;
  @override

  

  @override
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool nextDisable = false;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              // backgroundColor: defaultLightColor,
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
                  'Students',
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
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
            
                  children: [
                  

                    DecoratedBox(

                      
                        decoration: BoxDecoration(
                            // color:
                            //     defaultLightColor, //background color of dropdown button
                            // border: Border.all(color: Colors.black38, width: 3), //border of dropdown button
                            // borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                            // boxShadow: const <BoxShadow>[
                            //   BoxShadow(
                            //       color: Color.fromRGBO(0, 0, 0, 0.57),
                            //       blurRadius: 5
                            //       )
                            // ]
                            ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child:
                              DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey))),
                                  hint: const Text('choose level'),
                            value: cubit.dropdownValue,
                            items: cubit.levelsList,style: TextStyle(fontSize: 20,color: defaultColor,fontWeight: FontWeight.normal),
                                    onChanged: (String? newValue) {
                              cubit.allStudents(token, newValue!);
                              cubit.changeLevelNumber(newValue);
                              // print(cubit.allStudentsData!.length);
                              nextDisable = true;
                              // print(cubit.listOfStudents[0]["email"]);
                              print(newValue);
                              // setState(() {
                              //   dropdownValue = newValue!;
                              //   view = int.parse(newValue);
                              //   print(view);
                              // });
                              //get value when changed
                              // print("You have selected $newValue");
                            },
                            // dropdownColor:
                            //     lightDefaultColor, 
                            // // underline: Container(), 
                            // isExpanded: true, 
                           ),
                            

                          //     DropdownButton(
                          //   hint: const Text('choose level'),
                          //   value: cubit.dropdownValue,
                          //   items: cubit.levelsList,
                          //   onChanged: (String? newValue) {
                          //     cubit.allStudents(token, newValue);
                          //     cubit.changeLevelNumber(newValue);
                          //     // print(cubit.allStudentsData!.length);
                          //     nextDisable = true;
                          //     // print(cubit.listOfStudents[0]["email"]);
                          //     print(newValue);
                          //     // setState(() {
                          //     //   dropdownValue = newValue!;
                          //     //   view = int.parse(newValue);
                          //     //   print(view);
                          //     // });
                          //     //get value when changed
                          //     // print("You have selected $newValue");
                          //   },
                          //   icon: const Padding(
                          //       padding: EdgeInsets.only(left: 20),
                          //       child: Icon(Icons.arrow_circle_down_sharp)),
                          //   iconEnabledColor: defaultColor, 
                          //   style: TextStyle(
                                
                          //       color: defaultColor, 
                          //       fontSize: 20 
                          //       ),

                          //   dropdownColor:
                          //       lightDefaultColor, 
                          //   underline: Container(), 
                          //   isExpanded: true, 
                          // ),
          
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
  	shape: new RoundedRectangleBorder(
    	borderRadius: new BorderRadius.circular(30.0),
  	),
  ),
                        onPressed: nextDisable
                            ? () {
                                navigateTo(
                                    context,
                                    studentsOfLevel(
                                      levelNumber: cubit.level,
                                      ListOfStudents: cubit.allStudentsData,
                                    ));
                              }
                            : null,
                        child: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AppStates state) {}),
    );
  }
}
