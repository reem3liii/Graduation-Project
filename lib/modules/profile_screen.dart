import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/for_student/setting_screen.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/data.dart';
import 'package:saas/shared/styles/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColor,
        actions: [
          IconButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context)=> const SettingScreen()),
                );
              },
              icon: const Icon(Icons.settings,color: Colors.white,),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              width: double.infinity,
              height: height / 2.35,
              decoration: BoxDecoration(
                color: defaultColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: width / 6,
                    backgroundColor: Colors.transparent,
                    backgroundImage: const AssetImage('assets/images/student_profile.png'),
                  ),
                  SizedBox(
                    height: height / 65,
                  ),
                  Text(
                    data[data.length - 2].toString(),
                    style: titleStyle().copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    height: height / 65,
                  ),
                  Text(
                    data[data.length - 1].toString(),
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
            ),
          )
        ],
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