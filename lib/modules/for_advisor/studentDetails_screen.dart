import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';

class StudentDetails extends StatelessWidget { 
   final String nameOfStudent;

   const StudentDetails({Key? key,  required this.nameOfStudent})
      : super(key: key);
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
          nameOfStudent,
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
                     height: height / 15,
                     child: Row(
                       children: [
                         SizedBox(
                           width: width / 2.8,
                           child: Text(labels[index],
                               style: Theme.of(context)
                                   .textTheme
                                   .bodyText1!
                                   .copyWith(
                                   color: defaultColor,
                                   fontWeight: FontWeight.w600)),
                         ),
                         Text(
                           data[index].toString(),
                           style: Theme.of(context)
                               .textTheme
                               .bodyText1!
                               .copyWith(
                               color: Colors.black,
                               fontWeight: FontWeight.normal),
                         )
                       ],
                     ),
                   ),
                   separatorBuilder: (context, index) => Divider(
                     //  width: double.infinity,
                       thickness: 2,
                       indent: width / 3,
                       color: Colors.grey[300]),
                   itemCount: data.length - 2),
      ),
    );
  }
}
