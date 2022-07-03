import 'package:flutter/material.dart';
import 'package:saas/shared/design/colors.dart';

Widget mainCard({
  required double width,
  required double height,
  required String label,
  required IconData icon,
  required double iconWidth,
  BuildContext? context,
  required fun,
}) => GestureDetector(
  onTap: fun,
  child:   Card(

    clipBehavior: Clip.antiAlias,



    elevation: 5,

    shadowColor: defaultColor,



    shape: RoundedRectangleBorder(

      borderRadius: BorderRadius.circular(15.0),

    ),

    //  color: Colors.red,

    borderOnForeground: true,

    child: Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(

          icon,

          color: defaultColor,

          size: iconWidth,

        ),

        Text(

          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20,),
        ),

      ],

    ),

  ),
);
