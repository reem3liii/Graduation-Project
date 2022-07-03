import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/for_advisor/studentDetails_screen.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/studentNamesList.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String? dropdownValue;

  void addto() {
   for(var item in levels){
      listtt.add(DropdownMenuItem(
      child: Text("level " + i.toString()),
      value: i.toString(),
    )); 
       i++;

   }
  }

  int view = -1;
  var i = 1;
  var listtt = <DropdownMenuItem<String>>[];
    @override
  void initState() {
      super.initState();
      
       addto();
    }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
   
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
                decoration: BoxDecoration(
                    color:
                        defaultLightColor, //background color of dropdown button
                    border: Border.all(color: Colors.black38, width: 3), //border of dropdown button
                    borderRadius: BorderRadius.circular(50), //border raiuds of dropdown button
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.57), blurRadius: 5)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButton(
                    hint: const Text('choose level'),
                    value: dropdownValue,
                    items: listtt,

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                        view = int.parse(newValue);
                        print(view);
                      });
                      //get value when changed
                      print("You have selected $newValue");
                    },
                    icon: const Padding(
                        //Icon at tail, arrow bottom is default icon
                        padding: EdgeInsets.only(left: 20),
                        child: Icon(Icons.arrow_circle_down_sharp)),
                    iconEnabledColor: defaultColor, //Icon color
                    style: TextStyle(
                        //te
                        color: defaultColor, //Font color
                        fontSize: 20 //font size on dropdown button
                        ),

                    dropdownColor:
                        lightDefaultColor, //dropdown background color
                    underline: Container(), //remove underline
                    isExpanded: true, //make true to make width 100%
                  ),
                )),
const SizedBox(height: 20,),
            view == -1
                ? const SizedBox()
                : ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20),
                          child: SizedBox(
                            height: height / 15,
                            child: GestureDetector(
                              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentDetails(nameOfStudent: levels[view - 1][index]['name']
                                        .toString()))),
                              child: Row(
                                children: [
                                  Text(
                                    levels[view - 1][index]['id']
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: defaultColor,
                                            fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(
                                    width: width / 20,
                                  ),
                                  Text(
                                      levels[view - 1][index]['name']
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              color: defaultColor,
                                              fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(color: defaultColor,indent: width/20,endIndent: width/20,thickness: 1,),
                    itemCount: levels[0].length)
          ],
        ),
      ),
    );
  }
}
