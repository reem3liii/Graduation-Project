import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

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
          onPressed: () {},
        ),
        backgroundColor: defaultBeigeColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultBeigeColor,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Container(
        color: defaultBeigeColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              settingSectionName('Account'),
              heightSpace(),
              settingItem(const Icon(Icons.lock), 'Password'),
              heightSpace(),
              settingItem(
                  const Icon(Icons.phone_android_rounded), 'Phone number'),
              heightSpace(),
              settingSectionName('General'),
              heightSpace(),
              settingItem(const Icon(Icons.language_rounded), 'Language',
                  current: 'English'),
              heightSpace(),
              settingItem(const Icon(Icons.brightness_4_rounded), 'Theme',
                  current: 'Light'),
              heightSpace(),
              settingItem(
                  const Icon(Icons.help_outline_rounded), 'Help center'),
              heightSpace(),
              settingItem(const Icon(Icons.info_rounded), 'App info'),
              const Spacer(),
              TextButton(
                onPressed: () {
                  print('Logout');
                },
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    color: defaultColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          color: defaultBeigeColor,
                        ),
                        widthSpace(),
                        Text(
                          'LOGOUT',
                          style: titleStyle(size: 20, color: defaultBeigeColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
