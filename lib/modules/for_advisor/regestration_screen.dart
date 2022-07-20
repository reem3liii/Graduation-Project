// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:saas/modules/for_advisor/add_subject_screen.dart';
// import 'package:saas/shared/design/colors.dart';
// import 'package:saas/shared/items/components.dart';
// import 'package:saas/shared/items/studentNamesList.dart';

// class SubjectRegestrationScreen extends StatefulWidget {
//   const SubjectRegestrationScreen({Key? key}) : super(key: key);

//   @override
//   State<SubjectRegestrationScreen> createState() =>
//       _SubjectRegestrationScreenState();
// }

// class _SubjectRegestrationScreenState extends State<SubjectRegestrationScreen> {
//   String? dropdownValue;

//   void addto() {
//     for ( var item in levels) {
//       listtt.add(DropdownMenuItem(
//         child: Text("level " + i.toString()),
//         value: i.toString(),
//       ));
//       i++;
//     }
//   }

//   int view = -1;
//   var i = 1;
//   var listtt = <DropdownMenuItem<String>>[];
//   @override
//   void initState() {
//     super.initState();

//     addto();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       // backgroundColor: defaultLightColor,
//       appBar: AppBar(
//         leading: IconButton(
//             icon: const Icon(
//               Icons.arrow_back,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             }),
//         backgroundColor: defaultColor,
//         centerTitle: true,
//         iconTheme: IconThemeData(color: lightDefaultColor),
//         title: Text(
//           'Students',
//           style: titleStyle(
//             size: 20,
//             color: Colors.white,
//           ),
//         ),
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: defaultColor,
//           statusBarIconBrightness: Brightness.light,
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Column(
//           children: [
//             //        DropdownButton<String>(
//             //   value: dropdownValue,
//             //   icon: const Icon(Icons.arrow_drop_down),
//             //   // elevation: 16,
//             //   // style: const TextStyle(color: Colors.deepPurple),
//             //   underline:SizedBox(),
//             //   onChanged: (String? newValue) {
//             //     setState(() {
//             //       dropdownValue = newValue!;
//             //     });
//             //   },
//             //   items: <String>['One', 'Two', 'Free', 'Four']
//             //       .map<DropdownMenuItem<String>>((String value) {
//             //     return DropdownMenuItem<String>(
//             //       value: value,
//             //       child: Text(value),
//             //     );
//             //   }).toList(),
//             // )

//             DecoratedBox(
//                 decoration: BoxDecoration(
//                     color:
//                         defaultLightColor, //background color of dropdown button
//                     border: Border.all(color: Colors.black38, width: 3), //border of dropdown button
//                     borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
//                     boxShadow: const <BoxShadow>[
//                       BoxShadow(
//                           color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
//                     ]),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: DropdownButton(
//                     hint: const Text('choose level'),
//                     value: dropdownValue,
//                     items: listtt,

//                     onChanged: (String? newValue) {
//                       setState(() {
//                         dropdownValue = newValue!;
//                         view = int.parse(newValue);
//                         print(view);
//                       });
//                       //get value when changed
//                       print("You have selected $newValue");
//                     },
//                     icon: const Padding(
//                         //Icon at tail, arrow bottom is default icon
//                         padding: EdgeInsets.only(left: 20),
//                         child: Icon(Icons.arrow_circle_down_sharp)),
//                     iconEnabledColor: defaultColor, //Icon color
//                     style: TextStyle(
//                         //te
//                         color: defaultColor, //Font color
//                         fontSize: 20 //font size on dropdown button
//                         ),

//                     dropdownColor:
//                         lightDefaultColor, //dropdown background color
//                     underline: Container(), //remove underline
//                     isExpanded: true, //make true to make width 100%
//                   ),
//                 )),
//             const SizedBox(
//               height: 20,
//             ),
//             view == -1
//                 ? const SizedBox()
//                 : ListView.separated(
//                     shrinkWrap: true,
//                     itemBuilder: (context, index) => Padding(
//                           padding:
//                               const EdgeInsets.symmetric(horizontal: 20),
//                           child: SizedBox(
//                             height: height / 15,
//                             child: GestureDetector(
//                               // onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>addSubjectScreen(levelNum: view,studentNum: index,)))
//                               onTap: () {
//                                 var listOfSub = [];
//                                 // levels[view - 1][index]['sbjects']
//                                 //     .add('test');
//                                 var x =
//                                     levels[view - 1][index]['subjects'];
//                                 // print(x);
//                                 // x.add('st');
//                                 // print(x);
//                                 if (!x.isEmpty)
//                                { for (var ep in x) {
//                                   listOfSub.add(ep);
//                                 }}
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             AddSubjectScreen(
//                                             listOfSub: listOfSub,
//                                             studentNum: index,
//                                             levelNum: view,
//                                             )));

//                                 // print(x);
//                               },
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     levels[view - 1][index]['id']
//                                         .toString(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             color: defaultColor,
//                                             fontWeight:
//                                                 FontWeight.normal),
//                                   ),
//                                   SizedBox(
//                                     width: width / 30,
//                                   ),
//                                   Text(
//                                       levels[view - 1][index]['name']
//                                           .toString(),
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodyText1!
//                                           .copyWith(
//                                               color: defaultColor,
//                                               fontWeight:
//                                                   FontWeight.w600)),
                                  
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                     separatorBuilder: (context, index) => Divider(
//                           color: defaultColor,
//                           indent: width / 20,
//                           endIndent: width / 20,
//                           thickness: 1,
//                         ),
//                     itemCount: levels[0].length)
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_advisor/studentDetails_screen.dart';
import 'package:saas/modules/for_advisor/student_ofLevelRegester.dart';
import 'package:saas/modules/for_advisor/students_ofLevel-_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/studentNamesList.dart';

class SubjectRegestrationScreen extends StatelessWidget {
  SubjectRegestrationScreen(this.token, this.email, {Key? key}) : super(key: key);
  final token;
  final email;
  var dropDownValue;
  @override

  // void addto() {
  //   for (var item in levels) {
  //     listtt.add(DropdownMenuItem(
  //       child: Text("level " + i.toString()),
  //       value: i.toString(),
  //     ));
  //     i++;
  //   }
  // }

  // int view = -1;
  // var i = 1;

  @override
  // void initState() {
  //   super.initState();

  //   addto();
  // }

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
                  'Subject Regestration',
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
//                   children: [

// DropdownButton<String>(
//                     value: dropDownValue,
//                     icon: Icon(Icons.keyboard_arrow_down),
//                     iconSize: 28,
//                     elevation: 20,
//                     onChanged: ( newval){

//                     },
//                     items: <String>["Registration","Verification", "ArenaRun"]
//                         .map<DropdownMenuItem<String>>((String value){
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                         );
//                     }).toList(),
//                   ),
//                   ],
                  children: [
                    //        DropdownButton<String>(
                    //   value: dropdownValue,
                    //   icon: const Icon(Icons.arrow_drop_down),
                    //   // elevation: 16,
                    //   // style: const TextStyle(color: Colors.deepPurple),
                    //   underline:SizedBox(),
                    //   onChanged: (String? newValue) {
                    //     setState(() {
                    //       dropdownValue = newValue!;
                    //     });
                    //   },
                    //   items: <String>['One', 'Two', 'Free', 'Four']
                    //       .map<DropdownMenuItem<String>>((String value) {
                    //     return DropdownMenuItem<String>(
                    //       value: value,
                    //       child: Text(value),
                    //     );
                    //   }).toList(),
                    // )

                       DecoratedBox(
                        decoration: const BoxDecoration(
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
                                              const BorderSide(color: Colors.grey))),
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
                                    studentsOfLevelRegester(
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
