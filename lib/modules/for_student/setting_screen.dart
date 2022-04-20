import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/modules/setting_screens/phone.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';
import 'package:saas/main.dart';
import '../login_screen.dart';
import '../setting_screens/app_info.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'الاعدادات' : 'Settings',
          style: isArabic
              ? arTitleStyle(
                  color: defaultColor, size: 24, weight: FontWeight.w600)
              : titleStyle(
                  color: defaultColor, size: 24, weight: FontWeight.w600),
        ),
        //leading: IconButton(
        //  icon: isArabic
        //      ? const Icon(Icons.arrow_forward_ios_rounded)
        //      : const Icon(Icons.arrow_back_ios_new_rounded),
        //  onPressed: () {
        //    Navigator.pop(context);
        //  },
        //),
        backgroundColor: defaultBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        color: defaultBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              settingSectionName(isArabic ? 'الملف الشخصي' : 'Account'),
              heightSpace(),
              settingItem(
                  const Icon(Icons.lock),
                  isArabic ? 'كلمة المرور' : 'Password',
                  context,
                  const PasswordScreen()),
              heightSpace(),
              settingItem(
                  const Icon(Icons.phone_android_rounded),
                  isArabic ? 'رقم الهاتف' : 'Phone number',
                  context,
                  const PhoneScreen()),
              heightSpace(),
              settingSectionName(isArabic ? 'عام' : 'General'),
              heightSpace(),
              settingSwitchItem(
                  const Icon(Icons.language_rounded),
                  isArabic ? 'اللغة' : 'Language',
                  context,
                  const PasswordScreen(),
                  Icons.change_circle_outlined,
                  Icons.change_circle_outlined),
              heightSpace(),
              settingSwitchItem(
                  const Icon(Icons.brightness_4_rounded),
                  isArabic ? 'الاضاءة' : 'Theme',
                  context,
                  const PasswordScreen(),
                  Icons.light_mode_outlined,
                  Icons.dark_mode_outlined),
              heightSpace(),
              settingItem(
                  const Icon(Icons.info_rounded),
                  isArabic ? 'معلومات عن التطبيق' : 'App info',
                  context,
                  const InfoScreen()),
              const Spacer(),
              TextButton(
                onPressed: () {
                  navigateToThenRemove(context, const LoginScreen());
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
                        color: defaultColor,
                      ),
                      widthSpace(),
                      Text(
                        isArabic ? 'تسجيل الخروج' : 'LOGOUT',
                        style: isArabic
                            ? arTitleStyle(size: 20, color: defaultColor)
                            : titleStyle(size: 20, color: defaultColor),
                      ),
                    ],
                  ),
                ),
                //),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
