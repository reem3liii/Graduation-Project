import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/modules/login_screen.dart';
import 'package:saas/shared/cache_helper.dart';
import 'package:saas/shared/items/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:saas/shared/items/models.dart';
import 'package:saas/shared/design/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/onboarding1.png',
        title: 'Welcome to SAAS',
        body:
            'It is an acadimic support system for students and acadimic advisors.',
        arTitle: 'مرحباً بك في SAAS',
        arBody: 'نظام الدعم الأكاديمي للطلاب والمرشدين الأكاديميين.'),
    BoardingModel(
        image: 'assets/images/onboarding2.png',
        title: 'The goal of the application',
        body:
            'It helps you by suggesting courses that meet your current needs, and at the same time improve the academic performance.',
        arTitle: 'الهدف من التطبيق',
        arBody:
            'مساعدتك على اختيار المواد المناسبة لاحتياجاتك، وفي نفس الوقت تحسن من أداءك الأكاديمي.'),
    BoardingModel(
        image: 'assets/images/onboarding3.png',
        title: 'Let\'s get started',
        body:
            'You are now ready to use the application, you can login or sign up by using your university email.',
        arTitle: 'لنبدأ',
        arBody:
            ' أنت الآن مستعد لاستخدام التطبيق، يمكنك تسجيل الدخول أو الاشتراك عبر البريد الالكتروني الجامعي الخاص بك.'),
  ];

  bool isLast = false;

  void submit() {
    CacheHelper.putData(key: 'onboarding', value: true).then(
      (value) {
        if(value!){
            navigateToThenRemove(context, LoginScreen());
        }
      },
    );
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: submit,
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  isArabic ? 'تخطي' : 'SKIP',
                  style: isArabic
                      ? arBodyStyle(
                          weight: FontWeight.bold,
                          color: defaultColor,
                          size: 16)
                      : bodyStyle2(
                          weight: FontWeight.bold,
                          color: defaultColor,
                          size: 16),
                ),
              ),
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: defaultBackgroundColor,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          color: defaultBackgroundColor,
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                  controller: boardController,
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    controller: boardController,
                    count: boarding.length,
                    effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5,
                      activeDotColor: defaultColor,
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: () {
                      if (isLast) {
                        submit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 500,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      size: 15,
                    ),
                    backgroundColor: defaultColor,
                    mini: true,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        Text(
          isArabic ? model.arTitle : model.title,
          style: isArabic ? arTitleStyle() : titleStyle(),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          isArabic ? model.arBody : model.body,
          style: isArabic
              ? arBodyStyle(weight: FontWeight.w400)
              : bodyStyle2(weight: FontWeight.w400),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
