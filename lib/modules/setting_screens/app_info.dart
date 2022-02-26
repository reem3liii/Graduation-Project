import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/for_student/setting_screen.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About SAAS',
          style: titleStyle(
              color: defaultColor, size: 22, weight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: defaultBackArrow(),
          onPressed: () {
            navigateTo(context, const SettingScreen());
          },
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
          padding: const EdgeInsets.all(16),
          child: Container(
            height: 500,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: defaultLightColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/onboarding2.png'),
                  height: 250,
                ),
                Text(
                  'SAAS is an acadimic support system for students and acadimic advisors.\nIt helps you by suggesting courses that meet your current needs, and at the same time improve the academic performance.',
                  style: bodyStyle3(size: 20, weight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
