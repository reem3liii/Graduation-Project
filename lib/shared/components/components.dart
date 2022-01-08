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

TextStyle titleStyle(
        {color = Colors.black, double size = 30, weight = FontWeight.bold}) =>
    GoogleFonts.jost(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );

TextStyle bodyStyle(
        {color = Colors.black, size = 20.0, weight = FontWeight.bold}) =>
    GoogleFonts.abel(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );

Widget defaultTextField({
  required TextEditingController textEditingController,
  required TextInputType textInputType,
  required String hintText,
  required preIcon,
  required validator,
  bool isPassword = false,
  suffixIcon,
  suffixPressed,
  onTapFunction,
}) =>
    TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: validator,
      onTap: onTapFunction,
      decoration: InputDecoration(
        filled: true,
        hintText: hintText,
        prefixIcon: Icon(
          preIcon,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
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
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(30.0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(1, 3),
            color: Colors.grey,
          ),
        ],
      ),
      height: height,
      width: width,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 17),
        ),
        color: HexColor('064B68'),
      ),
    );

Widget defaultBackArrow() => const Icon(Icons.arrow_back_ios_new_rounded);

Widget defaultForwardArrow() => const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 20,
    );

Widget settingSectionName(name) => Text(
      name,
      style: titleStyle(color: defaultLightColor, size: 18),
    );

Widget settingItem(icon, title, {current = ''}) => InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: defaultLightColor.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              icon,
              widthSpace(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,

                  fontWeight: FontWeight.w400,

                  //color: Colors.blueGrey,
                ),
              ),
              const Spacer(),
              Text(
                current,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.blueGrey,
                ),
              ),
              widthSpace(),
              defaultForwardArrow(),
            ],
          ),
        ),
      ),
    );

Widget heightSpace() => const SizedBox(
      height: 10,
    );
Widget widthSpace() => const SizedBox(
      width: 10,
    );
