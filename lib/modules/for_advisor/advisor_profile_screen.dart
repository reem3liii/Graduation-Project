import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/for_student/setting_screen.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';

import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';

class ProfileAdvisorScreen extends StatelessWidget {
  ProfileAdvisorScreen({this.token,this.listOfData,this.listOfUser,Key? key}) : super(key: key);
  final token, listOfData,listOfUser;
  int selectedIndex = 3;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          builder: (BuildContext context, AppStates state) {
            AppCubit cubit = AppCubit();
            return Scaffold(
              appBar: AppBar(
                iconTheme: const IconThemeData(color: Colors.white),

                backgroundColor: defaultColor,
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingScreen()),
                      );
                    },
                    icon: const Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                ],
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultColor,
                  statusBarIconBrightness: Brightness.light,
                ),
                // automaticallyImplyLeading: false,
              ),
              backgroundColor: Colors.grey.shade100,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    ClipPath(
                      clipper: CustomClipPath(),
                      child: Container(
                        width: double.infinity,
                        height: height / 3,
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
                              backgroundImage: const AssetImage(
                                  'assets/images/advisorLogin.png'),
                            ),
                            SizedBox(
                              height: height /25,
                            ),
                            Text(
                              listOfUser[0].toString(),
                              style: titleStyle().copyWith(color: Colors.white),
                            ),
                            
                         
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 100,
                    ),
                    RawScrollbar(
                      // isAlwaysShown: true,
                      thumbColor: defaultColor,
                      radius: const Radius.circular(20),
                      interactive: true,
                      thickness: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [ 
                        ListView.separated(
                              physics: const BouncingScrollPhysics(),
                        // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                    height: height / 15,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width / 2.8,
                                          child: Text(
                                            advisorDataLabel[index].toString(),
                                              style:TextStyle(color: defaultColor,fontSize: 20,fontWeight: FontWeight.w600)
                                              ),
                                        ),
                                        Flexible(
                                          child: Text(
                                                                          listOfData[index+1].toString(),

                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 2,            
                       style:TextStyle(fontSize: 20)
,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) => Divider(
                                  //  width: double.infinity,
                                  thickness: 2,
                                  indent: width / 3,
                                  color: Colors.grey[300]),
                              itemCount: advisorDataLabel.length),
                    
                     
                        Divider(
                                  //  width: double.infinity,
                                  thickness: 2,
                                  indent: width / 3,
                                  color: Colors.grey[300]),
                  
                     ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              // scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => SizedBox(
                                    height: height / 15,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: width / 2.8,
                                          child: Text(
                                              advisorDataListLabel[index]
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                                                                            style:TextStyle(color: defaultColor,fontSize: 20,fontWeight: FontWeight.w600)
),
                                        ),
                                    
                                        Flexible(
                                          flex: 2,
                                          child: Text(
                                         index==1?listOfUser[index+1].toString().substring(0,10):   listOfUser[index+1].toString(),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 3,
                                                                   style:TextStyle(fontSize: 20)
,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                              separatorBuilder: (context, index) => Divider(
                                  //  width: double.infinity,
                                  thickness: 2,
                                  indent: width / 3,
                                  color: Colors.grey[300]),
                              itemCount: advisorDataListLabel.length),
                       
                       ]
                          
                        ),
                      ),
                    )
                           
                  ],
                ),
              ),
            );
          },
          listener: (BuildContext context, AppStates state) {}),
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
