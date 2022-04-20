import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/models.dart';
import 'package:saas/shared/colors.dart';

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

TextStyle arTitleStyle(
        {color = Colors.black, double size = 30, weight = FontWeight.bold}) =>
    TextStyle(
      fontFamily: 'IBM',
      fontSize: size,
      fontWeight: weight,
      color: color,
    );

TextStyle arBodyStyle(
        {color = Colors.black,
        double size = 20.0,
        weight = FontWeight.normal}) =>
    TextStyle(
      fontFamily: 'IBM',
      fontSize: size,
      fontWeight: weight,
      color: color,
    );

TextStyle bodyStyle(
        {color = Colors.black,
        double size = 20.0,
        weight = FontWeight.normal}) =>
    GoogleFonts.abel(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
TextStyle bodyStyle2(
        {color = Colors.black,
        double size = 20.0,
        weight = FontWeight.normal}) =>
    GoogleFonts.lato(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );
TextStyle bodyStyle3(
        {color = Colors.black,
        double size = 20.0,
        weight = FontWeight.normal}) =>
    GoogleFonts.actor(
      textStyle: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
      ),
    );

Widget defaultTextField({
  required TextEditingController textEditingController,
  required TextInputType textInputType,
  String hintText = '',
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

//Widget defaultBackArrow() => const Icon(Icons.arrow_back_ios_new_rounded);

Widget defaultForwardArrow() => const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 20,
    );

Widget settingSectionName(name) => Text(
      name,
      style: isArabic
          ? arTitleStyle(color: defaultColor, size: 20)
          : titleStyle(color: defaultColor, size: 20),
    );

Widget settingItem(icon, title, context, screen) => InkWell(
      onTap: () {
        navigateTo(context, screen);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          //color: defaultLightColor.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              widthSpace(),
              Text(
                title,
                style: isArabic ? arBodyStyle(size: 18) : bodyStyle3(size: 18),
              ),
              const Spacer(),
              defaultForwardArrow(),
            ],
          ),
        ),
      ),
    );

Widget settingSwitchItem(icon, title, context, screen, leftIcon, rightIcon) =>
    InkWell(
      onTap: () {
        navigateTo(context, screen);
      },
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          //color: defaultLightColor.withOpacity(0.5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              widthSpace(),
              Text(
                title,
                style: isArabic ? arBodyStyle(size: 18) : bodyStyle3(size: 18),
              ),
              const Spacer(),
              RollingSwitch.icon(
                onChanged: (bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                },
                rollingInfoLeft: RollingIconInfo(
                  icon: leftIcon,
                  backgroundColor: defaultColor,
                ),
                rollingInfoRight: RollingIconInfo(
                  icon: rightIcon,
                  backgroundColor: defaultColor,
                ),
                width: 85,
                //h//eight: 30,
                //innerSize: 20,
              )
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

Widget containerWithOROutShadow({
  required widget,
  double blurRadiusValue = 4,
  double offsetValue1 = 1,
  double offsetValue2 = 2,
  double height = 140,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.98),
        boxShadow: [
          BoxShadow(
            blurRadius: blurRadiusValue,
            offset: Offset(offsetValue1, offsetValue2),
            color: Colors.grey,
          ),
        ],
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: height,
      child: widget,
    );

Widget defaultCircularPercentIndicator({
  required String titleText,
  required String value,
  required Color color,
  required double percentValue,
}) =>
    Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          Text(
            titleText,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
          ),
          heightSpace(),
          Center(
            child: CircularPercentIndicator(
              radius: 85.0,
              lineWidth: 10.0,
              backgroundWidth: 6,
              animation: true,
              animationDuration: 1500,
              percent: percentValue,
              center: Text(
                value,
                style: bodyStyle(
                  color: color,
                  weight: FontWeight.w700,
                ),
                //TextStyle(fontSize: 18.0,color: color,fontWeight: FontWeight.w500),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: color,
              backgroundColor: Colors.grey.shade100,
            ),
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );

Widget defaultGridViewList({
  required list,
  required itembuild,
}) =>
    GridView.builder(
      padding: const EdgeInsets.all(5),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: list.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 170,
      ),
      itemBuilder: itembuild,
    );

Widget coursesList(CurrentCourses course) => containerWithOROutShadow(
      blurRadiusValue: 0,
      offsetValue1: 0,
      offsetValue2: 0.2,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                course.courseAbbreviation,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: course.color),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: course.color.withOpacity(0.2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            heightSpace(),
            Text(
              isArabic ? course.arCourseName : course.courseName,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
            Text(
              '(${course.courseCode})',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13.0,
              ),
            ),
            heightSpace(),
            Row(
              children: [
                Icon(
                  Icons.perm_identity,
                  color: Colors.grey.shade600,
                  size: 13,
                ),
                const SizedBox(
                  width: 4,
                ),
                Expanded(
                  child: Text(
                    isArabic
                        ? "دكتور ${course.arCourseProfessor}"
                        : "Dr.${course.courseProfessor}",
                    style:
                        TextStyle(fontSize: 12.0, color: Colors.grey.shade600),
                    //overflow: TextOverflow.fade,
                    maxLines: 2,
                    //softWrap: false,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );

Widget recCoursesItem(CurrentCourses course) => Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 14,
      ),
      child: Container(
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            widthSpace(),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                course.courseAbbreviation,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    color: courses[1].color),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: courses[1].color.withOpacity(0.2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            widthSpace(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isArabic ? course.arCourseName : course.courseName,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  '(${course.courseCode})',
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 12.0,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.perm_identity,
                      color: Colors.grey.shade600,
                      size: 16,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      isArabic
                          ? "دكتور ${course.arCourseProfessor}"
                          : "Dr.${course.courseProfessor}",
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w800,
                      ),
                      //overflow: TextOverflow.fade,
                      maxLines: 2,
                      //softWrap: false,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
              ],
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_circle),
              color: defaultColor,
              iconSize: 40,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.cancel),
              color: defaultColor,
              iconSize: 40,
            ),
          ],
        ),
      ),
    );
