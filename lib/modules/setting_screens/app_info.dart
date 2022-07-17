import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'عن التطبيق' : 'About SAAS',
                style: isArabic
                    ? arTitleStyle(
                        color: defaultColor, size: 22, weight: FontWeight.w600)
                    : AppBarTheme.of(context).titleTextStyle?.copyWith(
                          color: MyApp.themeNotifier.value == ThemeMode.light
                              ? defaultColor
                              : defaultLightColor,
                        ),
              ),
              //leading: IconButton(
              // icon: isArabic
              //      ? const Icon(Icons.arrow_forward_ios_rounded)
              //      : const Icon(Icons.arrow_back_ios_new_rounded),
              //  onPressed: () {
              //   Navigator.pop(context);
              // },
              //),
              backgroundColor: MyApp.themeNotifier.value == ThemeMode.light
                  ? defaultBackgroundColor
                  : defaultDarkBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: MyApp.themeNotifier.value == ThemeMode.light
                    ? defaultBackgroundColor
                    : defaultDarkBackgroundColor,
                statusBarIconBrightness:
                    MyApp.themeNotifier.value == ThemeMode.light
                        ? Brightness.dark
                        : Brightness.light,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/onboarding1.png'),
                      height: 250,
                    ),
                    Text(
                      'SAAS is an acadimic support system for students and acadimic advisors',
                      style:  bodyStyle3(size: 20, weight: FontWeight.bold,
                          color: MyApp.themeNotifier.value == ThemeMode.light? Colors.black: Colors.white,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/images/onboarding2.png'),
                      height: 250,
                    ),
                    Text(
                       'The goal of the application is to help you by suggesting courses that meet your current needs, and at the same time improve the academic performance',
                      style: bodyStyle3(size: 20, weight: FontWeight.bold,
                        color: MyApp.themeNotifier.value == ThemeMode.light? Colors.black: Colors.white,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/images/onboarding3.png'),
                      height: 250,
                    ),
                    /*Text(
                       'SAAS is an acadimic support system for students and acadimic advisors.\nIt helps you by suggesting courses that meet your current needs, and at the same time improve the academic performance.',
                      style: isArabic
                          ? arBodyStyle(size: 20, weight: FontWeight.bold)
                          : bodyStyle3(size: 20, weight: FontWeight.bold),
                    ),*/
                    
                  ],
                ),
              ),
              
            ),
          );
        },
      ),
    );
  }
}
