import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rolling_switch/rolling_switch.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/design/colors.dart';
import 'json_models.dart';
import 'models.dart';

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
  String labelText = '',
  required preIcon,
  required validator,
  bool isPassword = false,
  suffixIcon,
  suffixPressed,
  onTapFunction,
  Color iconcolor = Colors.white,
}) =>
    TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: validator,
      onTap: onTapFunction,
      decoration: InputDecoration(
        //filled: true,
        labelText: labelText,
        prefixIcon: Icon(
          preIcon,
          //color: iconcolor,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: suffixPressed,
              )
            : null,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          borderSide: BorderSide(color: Colors.grey, width: 0.8),
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
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            defaultColor,
            defaultColor1,
          ],
        ),
        borderRadius: BorderRadiusDirectional.circular(25.0),
        /*boxShadow: [
          BoxShadow(
            blurRadius: 5,
            offset: Offset(1, 3),
            color: Colors.grey.shade700,
          ),
        ],*/
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
        //color: HexColor('064B68'),
      ),
    );

Widget defaultBackArrow() => const Icon(Icons.arrow_back_ios_new_rounded);

Widget defaultForwardArrow() => const Icon(
      Icons.arrow_forward_ios_rounded,
      size: 20,
    );

Widget settingSectionName(name) => Text(
      name,
      style: isArabic
          ? arTitleStyle(color: MyApp.themeNotifier.value == ThemeMode.light? defaultColor: defaultLightColor, size: 20)
          : titleStyle(color: MyApp.themeNotifier.value == ThemeMode.light? defaultColor: defaultLightColor, size: 20),
    );

Widget adminSectionName(name, icon) => Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 8,
        start: 8,
      ),
      child: Row(
        children: [
          Text(
            name,
            style: isArabic
                ? arTitleStyle(color: defaultColor, size: 20)
                : titleStyle(color: defaultColor, size: 20),
          ),

          //widthSpace(),

          //Icon(

          //  icon,

          //  color: defaultColor,

          //),
        ],
      ),
    );

Widget settingItem(icon, title, context, screen, {void Function()? fun}) =>
    InkWell(
      onTap: () {
        navigateTo(context, screen);
        fun;
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
              widthSpace(),
              Text(
                title,
                style: isArabic
                    ? arBodyStyle(size: 18)
                    : bodyStyle3(
                        size: 18,
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.black
                            : Colors.white),
              ),
              const Spacer(),
              defaultForwardArrow(),
            ],
          ),
        ),
      ),
    );

Widget settingItemAdmin(icon, title, function) => InkWell(
      onTap: function,
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
              widthSpace(),
              Text(
                title,
                style: isArabic
                    ? arBodyStyle(size: 18)
                    : bodyStyle3(
                        size: 18,
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.black
                            : Colors.white),
              ),
              const Spacer(),
              defaultForwardArrow(),
            ],
          ),
        ),
      ),
    );

Widget settingSwitchItem(icon, title, context, leftIcon, rightIcon, function) =>
    InkWell(
      /*onTap: () {
        navigateTo(context, screen);
      },*/
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              icon,
              widthSpace(),
              widthSpace(),
              Text(
                title,
                style: isArabic
                    ? arBodyStyle(size: 18)
                    : Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
              ),
              const Spacer(),
              RollingSwitch.icon(
                onChanged: function,
                initialState: MyApp.themeNotifier.value == ThemeMode.dark? true:false,
                /*(bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                },*/
                rollingInfoLeft: RollingIconInfo(
                  icon: leftIcon,
                  backgroundColor: defaultColor,
                ),
                rollingInfoRight: RollingIconInfo(
                  icon: rightIcon,
                  backgroundColor: defaultColor,
                ),
                width: 80,
                //h//eight: 30,
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
  required height,
  required Color color,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: color,
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
  required Color titleColor,
  required Color backgroundColor,
  required double percentValue,
  required double radius,
  required double height,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Text(
            titleText,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          SizedBox(
            height: height,
          ),
          Center(
            child: CircularPercentIndicator(
              radius: radius,
              lineWidth: 9.0,
              backgroundWidth: 5,
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
              //backgroundColor: Colors.grey.shade100,
              backgroundColor: backgroundColor,
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
        mainAxisExtent: 220,
      ),
      itemBuilder: itembuild,
    );

Widget coursesList(
  CurrentCourse course, {
  required double height,
  required Color color,
  required Color titleColor,
  required BuildContext context,
}) =>
    containerWithOROutShadow(
      blurRadiusValue: 0,
      offsetValue1: 0,
      offsetValue2: 0.2,
      widget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                createCourseAbbreviation(course.courseName.toString()),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: chooseColor(course.courseCode.toString())),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    chooseColor(course.courseCode.toString()).withOpacity(0.2),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
            ),
            SizedBox(
              height: height / 18,
            ),
            Text(
              //isArabic ? 'course.arCourseName' :
              '${course.courseName}',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Text(
              '(${course.courseCode})',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            SizedBox(
              height: height / 30,
            ),
            Row(
              children: [
                /*Icon(
              Icons.perm_identity,
              color: Colors.grey.shade600,
              size: 15,
            ),
            const SizedBox(
              width: 5,
            ),*/
                Expanded(
                  child: Text(
                    //isArabic
                    // ? "دكتور ${course.arCourseProfessor}":
                    "${course.instructorName}",
                    style:
                        TextStyle(fontSize: 15.0, color: Colors.grey.shade700),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
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
      height: height,
      color: color,
    );

Widget recCoursesItem(
  String course, {
  required double height,
  required double width,
  required Color color,
  required Color titleColor,
  required BuildContext context,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 12,
      ),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  createCourseAbbreviation(course),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.green),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green.withOpacity(0.2),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
              ),
              const Spacer(),
              SizedBox(
                width: width / 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      //isArabic ? course.arCourseName :
                      course,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        const Icon(Icons.watch_later_outlined,color: Colors.grey,size: 17,),
                        const SizedBox(width: 10,),
                        Text(
                          '${coursesHours(course).toString()} credits',
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    /*const SizedBox(
                      height: 5,
                    ),*/
                    /*Row(
                      children: [
                        Icon(
                          Icons.perm_identity,
                          color: Colors.grey.shade600,
                          size: 16,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            //strutStyle: StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w800,
                              ),
                              text: isArabic
                                  ? "دكتور  ${course.arCourseProfessor}"
                                  : "Dr. ${course.courseProfessor}",
                            ),
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),*/
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  print('add course');
                  bool isExist = false;
                  if(recCoursesForStudent.isEmpty){
                    recCoursesForStudent.add(course.toString());
                    semesterHours += coursesHours(course);
                    showToast('This course selected successfully', ToastStates.Success);
                  }
                  else{
                    for(var i=0 ; i< recCoursesForStudent.length ; i++){
                      if(recCoursesForStudent[i] == course){
                        isExist = true;
                        break;
                      }
                      else{
                        isExist = false;
                      }
                    }
                    if(isExist){
                      showToast('This Course is already chosen', ToastStates.Error);
                    }
                    else{
                      if(semesterHours+coursesHours(course) <= maxHours){
                        recCoursesForStudent.add(course.toString());
                        showToast('This course selected successfully', ToastStates.Success);
                        semesterHours += coursesHours(course);
                      }
                      else{
                        showToast('This course can not selected because you will exceed the maximum number of hours available.', ToastStates.Error);
                      }

                    }
                  }
                  for(var i=0 ; i< recCoursesForStudent.length ; i++){
                    print(recCoursesForStudent[i]);
                  }
                  print(semesterHours.toString());
                  print(recCoursesForStudent.length);
                },
                icon: const Icon(Icons.add_circle_rounded),
                color: defaultColor1,
                iconSize: 30,
              ),
              IconButton(
                onPressed: () {
                  print('remove course');
                  bool isNotExist = false;
                  int indexCourse = 0;
                  if(recCoursesForStudent.isEmpty){
                    showToast('The selected course list is empty.', ToastStates.Error);
                  }
                  else{
                    for(var i=0 ; i< recCoursesForStudent.length ; i++){
                      if(recCoursesForStudent[i] == course){
                        indexCourse = i;
                        isNotExist = true;
                        break;

                      }
                      else{
                        isNotExist = false;

                      }
                    }
                    if(isNotExist){
                      recCoursesForStudent.removeAt(indexCourse);
                      showToast('This Course is deleted', ToastStates.Error);
                      semesterHours -= coursesHours(course);
                    }
                    else{
                      showToast('This course is not in the selected courses list', ToastStates.Warning);
                    }
                  }

                  for(var i=0 ; i< recCoursesForStudent.length ; i++){
                    print(recCoursesForStudent[i].replaceAll('\\"','"').toString());
                  }
                  print(recCoursesForStudent);
                  print(semesterHours.toString());
                  print(recCoursesForStudent.length);
                },
                icon: const Icon(Icons.cancel_rounded),
                color: Colors.redAccent.shade700,
                iconSize: 30,
              ),
            ],
          ),
        ),
      ),
    );

Widget adminButtons(
        {addIcon = Icons.person_add,
        editIcon = Icons.edit,
        deleteIcon = Icons.delete}) =>
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                addIcon, //Icons.person_add
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          widthSpace(),
          Container(
            decoration: BoxDecoration(
              color: defaultLightColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                editIcon, //Icons.person_add
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'EDIT',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          widthSpace(),
          Container(
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(
                deleteIcon,
                color: Colors.black,
                size: 20,
              ),
              label: const Text(
                'DELETE',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget adminButton(icon, label) => Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: defaultLightColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton.icon(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.black,
            size: 22,
          ),
          label: Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );

enum ToastStates { Success, Error, Warning }

void showToast(String msg, ToastStates state) => Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16,
    );

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.Success:
      color = Colors.green;
      break;
    case ToastStates.Warning:
      color = Colors.amber;
      break;
    case ToastStates.Error:
      color = Colors.red;
      break;
  }
  return color;
}

Color chooseColor(String str) {
  Color color;
  if (str[0] == 'M') {
    color = Colors.pink;
  } else if (str[0] == 'U') {
    color = Colors.purple;
  } else if (str[0] == 'C') {
    color = Colors.cyan;
  } else if (str[0] == 'I') {
    color = Colors.indigo;
  } else if (str[0] == 'S') {
    color = Colors.deepOrange;
  } else {
    color = Colors.green;
  }
  return color;
}

String createCourseAbbreviation(String Str) {
  List<String> a = [];
  for (var i = 0; i < Str.length; i++) {
    if (Str[i].toUpperCase() == Str[i] && Str[i] != ' ' && Str[i] != '-'&&Str[i] != '&') {
      a.add(Str[i].toString());
    }
  }
  String abbreviation = a.join();
  //print(abbreviation);
  return abbreviation;
}
int coursesHours(String Str) {
  int hours = 0;
  if(Str == 'Technical Writing'){
    hours = 2;
  }
  else{
    hours = 3;
  }
  return hours;
}

deleteDialog(context,deleteFun,cancelFun) => showDialog(
    builder: (BuildContext context) => AlertDialog(
          content: Text(
            "Are you sure you want to delete it?",
            style: titleStyle(
              color: defaultColor,
              size: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: deleteFun,
              child: Text(
                "YES",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: cancelFun,
              child: Text("NO"),
            ),
          ],
          elevation: 20,
        ),
    context: context,
    barrierDismissible: false);

List studentKeys = ["id", "fullName", "email", "level", "phone"];
List studentKeysLabel = ["ID", "Name", "Email", "Level", "Phone"];

List advisorDataLabel = ["Email", "ID", "Role"];
List advisorDataListLabel = ["Gender","Birth Of Date","Address","City","Phone Number"];

List coursesKeys = ["instructorName", "courseName", "courseCode", "level"];
List coursesKeysLabel = [
  "Instructor Name",
  "Course Name",
  "Course Code",
  "Level"
];
