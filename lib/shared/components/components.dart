import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:saas/shared/styles/colors.dart';

void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);

void navigateToThenRemove(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
      (route) => false,
);

TextStyle titleStyle() => GoogleFonts.jost(
  textStyle: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  ),
);

TextStyle bodyStyle() => GoogleFonts.abel(
  textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);

Widget defaultTextField ({
  required TextEditingController textEditingController,
  required TextInputType textInputType,
  required String hintText,
  required preIcon,
  required validator,
  bool isPassword = false,
  suffixIcon,
  suffixPressed,
  onTapFunction,
}) => TextFormField(
  controller: textEditingController,
  keyboardType: textInputType,
  obscureText: isPassword,
  validator: validator,
  onTap: onTapFunction,
  decoration: InputDecoration(
    filled: true,
    hintText: hintText,
    prefixIcon: Icon(preIcon,),
    suffixIcon: suffixIcon != null? IconButton(icon: Icon(suffixIcon),onPressed: suffixPressed,) : null,
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15),),
    ),
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15),),
      borderSide: BorderSide.none,
    ),
  ),
);

Widget defaultButton({
  double width = double.infinity,
  double height = 50,
  Color textColor = Colors.white,
  required function,
  required String text,
}) => Container(
  decoration: BoxDecoration(
    borderRadius: BorderRadiusDirectional.circular(30.0),
    boxShadow:const [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(1,3),
        color: Colors.grey,
      ),
    ],
  ),
  height: height,
  width: width,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  child: MaterialButton(
    onPressed: function,
    child: Text(text, style: TextStyle(color: textColor,fontSize: 17),),
    color: HexColor('064B68'),
  ),
);
