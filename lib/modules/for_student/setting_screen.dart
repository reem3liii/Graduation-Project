import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/modules/setting_screens/phone.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/json_models.dart';
import '../login_screen.dart';
import '../setting_screens/app_info.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (BuildContext context,AppStates state){},
        builder: (BuildContext context,AppStates state){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'الاعدادات' : 'Settings',
                style: isArabic
                    ? arTitleStyle(
                    color: defaultColor, size: 24, weight: FontWeight.w600)
                    : AppBarTheme.of(context).titleTextStyle?.copyWith(
                  color: MyApp.themeNotifier.value == ThemeMode.light? defaultColor: defaultLightColor,
                ),
              ),
              backgroundColor: MyApp.themeNotifier.value == ThemeMode.light? defaultBackgroundColor:defaultDarkBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: MyApp.themeNotifier.value == ThemeMode.light? defaultBackgroundColor:defaultDarkBackgroundColor,
                statusBarIconBrightness: MyApp.themeNotifier.value == ThemeMode.light? Brightness.dark:Brightness.light,
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  settingSectionName(
                      isArabic ? 'الملف الشخصي' : 'Account',
                      //context
                  ),
                  heightSpace(),
                  settingItem(
                    const Icon(Icons.lock),
                    isArabic ? 'كلمة المرور' : 'Password',
                    context,
                    const PasswordScreen(),
                  ),
                  heightSpace(),
                  settingItem(
                    const Icon(Icons.phone_android_rounded,),
                    isArabic ? 'رقم الهاتف' : 'Phone number',
                    context,
                    const PhoneScreen(),
                  ),
                  heightSpace(),
                  settingSectionName(
                    isArabic ? 'عام' : 'General',
                    //context,
                  ),
                  heightSpace(),
                  settingSwitchItem(
                    const Icon(Icons.language_rounded,),
                    isArabic ? 'اللغة' : 'Language',
                    context,
                    //const PasswordScreen(),
                    Icons.change_circle_outlined,
                    Icons.change_circle_outlined,
                        (bool state){},
                  ),
                  heightSpace(),
                  settingSwitchItem(
                    const Icon(Icons.brightness_4_rounded,),
                    isArabic ? 'الاضاءة' : 'Theme',
                    context,
                    //const PasswordScreen(),
                    Icons.light_mode_outlined,
                    Icons.dark_mode_outlined,
                        (bool state){
                          MyApp.themeNotifier.value =
                          MyApp.themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                  ),
                  heightSpace(),
                  settingItem(
                    const Icon(Icons.info_rounded,),
                    isArabic ? 'معلومات عن التطبيق' : 'App info',
                    context,
                    const InfoScreen(),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      semestersAndGrades = [];
                      currentCourses = [];
                      totalHours = 0;
                      totalGpa = 0;
                      userInformation = [];
                      navigateToThenRemove(context, LoginScreen());
                      print('Logout');
                    },
                    /*child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: defaultColor,
                      ),*/
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.logout_rounded,
                            color:  MyApp.themeNotifier.value == ThemeMode.light? defaultColor: defaultLightColor,
                          ),
                          widthSpace(),
                          Text(
                            isArabic ? 'تسجيل الخروج' : 'LOGOUT',
                            style: isArabic
                                ? arTitleStyle(size: 20, color: defaultColor)
                                : titleStyle(size: 20, color:  MyApp.themeNotifier.value == ThemeMode.light? defaultColor: defaultLightColor,),
                          ),
                        ],
                      ),
                    ),
                    //),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
