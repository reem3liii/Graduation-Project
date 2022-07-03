import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/for_advisor/advisor_profile_screen.dart';
import 'package:saas/modules/for_advisor/advisor_screen.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';



class HomeAdvisorScreen extends StatefulWidget {
  const HomeAdvisorScreen({Key? key}) : super(key: key);

  @override
  State<HomeAdvisorScreen> createState() => _HomeAdvisorScreenState();
}

class _HomeAdvisorScreenState extends State<HomeAdvisorScreen> {
  @override
  Widget build(BuildContext context) {

 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultColor,
        centerTitle: true,
        iconTheme: IconThemeData(color: lightDefaultColor),
        title: Text(
          'Hi, Ahmed fouad 👋',
          style: titleStyle(
            size: 20,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: GestureDetector(
                  onTap: () {
                    navigateTo(context, const ProfileAdvisorScreen());
                  },
                  child: Image.asset(
                    'assets/images/advisorLogin.png',
                  )),
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),

      //   drawer: Drawer(
      //     backgroundColor: Colors.grey[100],

      //     child: ListView(
      //       padding: EdgeInsets.zero,
      //       children: [
      //         SizedBox(
      //           height: height / 5,
      //           child: DrawerHeader(
      //             decoration: BoxDecoration(
      //               color: lightDefaultColor,
      //             ),
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
      //               children: [
      //                 CircleAvatar(
      //                   backgroundImage: const AssetImage(
      //                     'assets/images/advisorLogin.png',
      //                   ),
      //                   minRadius: width / 15,
      //                   maxRadius: width / 10,
      //                 ),
      //                 Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     Text(
      //                       'Ahmed fouad',
      //                       style: TextStyle(color: defaultColor, fontSize: 20),
      //                     ),
      //                     SizedBox(
      //                       height: height / 60,
      //                     ),
      //                     Text(
      //                       'ddnfd15261',
      //                       style: TextStyle(
      //                           color: defaultColor.withOpacity(0.7),
      //                           fontSize: 15),
      //                     )
      //                   ],
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      // //         ListView.builder(

      // // scrollDirection: Axis.vertical,
      // // shrinkWrap: true,
      // //           itemCount: titles.length,
      // //           itemBuilder: (context, index) => ListTile(
      // //             tileColor: selectedIndex==index?lightDefaultColor:null,
      // //             title:  Text(titles[index]),
      // //             onTap: () {
      // //               onItemTapped(index);
      // //               Navigator.pop(context);
      // //             },
      // //           ),
      // //         ),

      //       ],
      //     ),
      //   ),

      body: const AdvisorScreen(),
    );
  }
}
