import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/for_student/setting_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/data.dart';
import 'package:saas/shared/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SettingScreen()),
                    );
                  },
                  icon: const Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    width: double.infinity,
                    height: height / 2.3,
                    decoration: BoxDecoration(
                      color:
                      //darkPrimaryColor,
                      defaultColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: width / 6,
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                          const AssetImage('assets/images/student_profile.png'),
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          isArabic
                              ? arData[arData.length - 2].toString()
                              : data[data.length - 2].toString(),
                          style: isArabic
                              ? arTitleStyle().copyWith(color: Colors.white)
                              : titleStyle().copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: height / 65,
                        ),
                        Text(
                          isArabic
                              ? arData[arData.length - 1].toString()
                              : data[data.length - 1].toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: lightDefaultColor),
                        ),
                        // Text(
                        //   data[3],
                        //   style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 30,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        // Text(
                        //   data[4],
                        //   style: TextStyle(
                        //       color: Colors.grey[200],
                        //       fontSize: 20),
                        // ),
                        //  Text(
                        //   data[5],
                        //   style: TextStyle(
                        //    color: Colors.grey[200],
                        //       fontSize: 20),
                        // )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 80,
                ),
                Expanded(
                  child: RawScrollbar(
                    isAlwaysShown: true,
                    thumbColor: defaultColor,
                    radius: const Radius.circular(20),
                    interactive: true,
                    thickness: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => SizedBox(
                            height: height / 15,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 3,
                                  child: Text(
                                      isArabic ? arLabels[index] : labels[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                        color:
                                        //defaultLightColor,
                                        defaultColor,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      )),
                                ),
                                Text(
                                  isArabic
                                      ? arData[index].toString()
                                      : data[index].toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                    color:
                                    //Colors.white,
                                    Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  ),
                                )
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(
                            //  width: double.infinity,
                              thickness: 0.5,
                              indent: width / 3,
                              color:
                              //Colors.grey[800],
                              Colors.grey[300],
                          ),
                          itemCount: data.length - 2),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}




class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 8, size.height - 40, size.width / 4, size.height - 20);
    path.quadraticBezierTo(
        3 / 8 * size.width, size.height, size.width / 2, size.height - 20);

    path.quadraticBezierTo(size.width * 5 / 8, size.height - 40,
        size.width * 3 / 4, size.height - 20);
    path.quadraticBezierTo(
        7 / 8 * size.width, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
