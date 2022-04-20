import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/onboarding_screen.dart';
import 'package:saas/shared/colors.dart';

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
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: defaultLightColor,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultLightColor,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        color: defaultLightColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              child: Image(
                image: AssetImage('assets/images/SAAS Logo 1.png'),
                width: 180,
                height: 180,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            LinearProgressIndicator(
              backgroundColor: defaultBackgroundColor,
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
