import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          isArabic ? 'عن التطبيق' : 'About SAAS',
          style: isArabic
              ? arTitleStyle(
                  color: defaultColor, size: 22, weight: FontWeight.w600)
              : titleStyle(
                  color: defaultColor, size: 22, weight: FontWeight.w600),
        ),
        //leading: IconButton(
        // icon: isArabic
        //      ? const Icon(Icons.arrow_forward_ios_rounded)
        //      : const Icon(Icons.arrow_back_ios_new_rounded),
        //  onPressed: () {
        //   Navigator.pop(context);
        // },
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
          padding: const EdgeInsets.all(16),
          child: Container(
            height: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: defaultLightColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/onboarding2.png'),
                  height: 250,
                ),
                Text(
                  isArabic
                      ? 'تطبيق SAAS هو نظام دعم أكاديمي للطلاب والمرشدين الأكادميين. \nيساعدك من خلال اقتراح المقررات التي تلبي احتياجاتك الحالية، وفي نفس الوقت تحسن الأداء الأكاديمي.'
                      : 'SAAS is an acadimic support system for students and acadimic advisors.\nIt helps you by suggesting courses that meet your current needs, and at the same time improve the academic performance.',
                  style: isArabic
                      ? arBodyStyle(size: 20, weight: FontWeight.bold)
                      : bodyStyle3(size: 20, weight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
