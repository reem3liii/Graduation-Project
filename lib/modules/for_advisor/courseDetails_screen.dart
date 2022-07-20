import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';

class CourseDetails extends StatelessWidget {
  final chosenCourse;

  const CourseDetails({Key? key, required this.chosenCourse}) : super(key: key);
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
          chosenCourse["courseName"],
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
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index) => SizedBox(
                  //  height: height / 15,
                  child: Row(
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: width / 2.8,
                          child: Text(coursesKeysLabel[index],
                              style: TextStyle(fontSize: 20,color: defaultColor,fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(width: width / 10),
                      Flexible(
                        child: Text(
                          chosenCourse[coursesKeys[index]].toString(),
                          style: TextStyle(fontSize: 20,color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
              height: height/10,
              child: Divider(
                  thickness: 2, indent: width / 3, color: Colors.grey[300]),
            ),
            itemCount: coursesKeys.length),
      ),
    );
  }
}
