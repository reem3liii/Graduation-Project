import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/onboarding_screen.dart';
import 'package:saas/shared/cache_helper.dart';
import 'package:saas/shared/design/colors.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    CacheHelper.putData(key: 'splash', value: true);
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          //backgroundColor: defaultColor,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: defaultColor,
            statusBarIconBrightness: Brightness.light,
            systemStatusBarContrastEnforced: false,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            defaultColor,
            defaultColor,
            defaultColor1,
            defaultLightColor,
          ],
        )),
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: height / 4,
            ),
            const Image(
              image: AssetImage('assets/images/SAAS Logo 1.png'),
              width: 185,
              height: 185,
            ),
            //Text('SAAS',style: titleStyle(color: Colors.white),),
            const Spacer(),
            LinearProgressIndicator(
              backgroundColor: defaultLightColor,
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Color.fromARGB(255, 6, 75, 104)),
              minHeight: 5,
            ),
          ],
        ),
      ),
    );
  }
}
