import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/setting_screens/password.dart';
import 'package:saas/modules/setting_screens/phone.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

import '../login_screen.dart';
import '../setting_screens/app_info.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: titleStyle(
              color: defaultColor, size: 24, weight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: defaultBackArrow(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
              settingSectionName('Account'),
              heightSpace(),
              settingItem(const Icon(Icons.lock), 'Password', context,
                  const PasswordScreen()),
              heightSpace(),
              settingItem(const Icon(Icons.phone_android_rounded),
                  'Phone number', context, const PhoneScreen()),
              heightSpace(),
              settingSectionName('General'),
              heightSpace(),
              settingSwitchItem(
                  const Icon(Icons.language_rounded),
                  'Language',
                  context,
                  const PasswordScreen(),
                  Icons.change_circle_outlined,
                  Icons.change_circle_outlined),
              heightSpace(),
              settingSwitchItem(
                  const Icon(Icons.brightness_4_rounded),
                  'Theme',
                  context,
                  const PasswordScreen(),
                  Icons.light_mode_outlined,
                  Icons.dark_mode_outlined),
              heightSpace(),
              settingItem(const Icon(Icons.info_rounded), 'App info', context,
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
                          'LOGOUT',
                          style: titleStyle(size: 20, color: defaultColor),
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
