

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';

class ClassScheduleScreen extends StatelessWidget {
  ClassScheduleScreen(
      {Key? key})
      : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              backgroundColor: defaultColor,
              centerTitle: true,
              iconTheme: IconThemeData(color: lightDefaultColor),
              title: Text(
                'Class Schedule',
                // userList.toString(),
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
            body: Center(child: Text("No Scehdule to show Now!!",style: TextStyle(fontSize: 25),)),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }

}
