import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  'add subjects',
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:showlist? Column(
          children: [
            
            showlist
                ? ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => SizedBox(
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
                                style:TextStyle(color: defaultColor,fontSize:20,fontWeight: FontWeight.w600)
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
                    separatorBuilder: (context, index) => Divider(
                          color: defaultColor,
                          indent: width / 20,
                          endIndent: width / 20,
                          thickness: 1,
                        ),
                    itemCount: widget.listOfSub.length)
                : const SizedBox(),
          ],
        ):Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonBool
                ? Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                             style: ElevatedButton.styleFrom(primary: defaultColor),

                        
                          onPressed: () {
                            setState(() {
                              buttonBool = false;
                              widget.listOfSub.isEmpty
                                  ? hideList = true
                                  : showlist = true;
                            });
                          },
                          child: const Text('show saved subjects list')),
                    ),
                  ],
                )
                : const SizedBox(),
            hideList
                ? Center(
                  
                    child: Column(
                    children: [
                      
                      const Text('No list Found',style:TextStyle(fontSize: 20) ,),
                      TextButton(
                          onPressed: () {
                            navigateTo(context, GPACalculator());
                          },
                          child: const Text('use recommendation system?'))
                    ],
                  ))
                : const SizedBox(),
          ],
        ),
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


