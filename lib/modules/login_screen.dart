import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/colors.dart';
import 'for_student/main_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  bool get isEmail {
    String p =
        '[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*@ci.suez.edu.eg';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(emailController.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(15.0),
        child: AppBar(
          backgroundColor: defaultLightColor,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: defaultLightColor,
            statusBarIconBrightness: Brightness.light,
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      backgroundColor: defaultLightColor,
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/login.png',
                      width: 175,
                      height: 175,
                    ),
                  ),
                  heightSpace(),
                  heightSpace(),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.98),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 35, vertical: 20),
                        child: Column(
                          children: [
                            Text(
                              isArabic ? 'تسجيل الدخول' : 'Sign In',
                              style: isArabic
                                  ? arTitleStyle(
                                      size: 25,
                                    )
                                  : titleStyle(
                                      size: 25,
                                    ),
                            ),
                            heightSpace(),
                            heightSpace(),
                            defaultTextField(
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText:
                                  isArabic ? 'البريد الإلكتروني' : 'E-mail',
                              preIcon: Icons.email,
                              validator: (emailController) {
                                if (emailController.toString().isEmpty) {
                                  return isArabic
                                      ? 'أدخل البريد الإلكتروني!'
                                      : 'Email Field is Empty!';
                                } else if (!isEmail) {
                                  return isArabic
                                      ? 'تحقق من بريدك الإلكتروني'
                                      : 'Check Your Email';
                                }
                                return null;
                              },
                            ),
                            heightSpace(),
                            defaultTextField(
                              textEditingController: passwordController,
                              textInputType: TextInputType.visiblePassword,
                              hintText: isArabic ? 'كلمة المرور' : 'Password',
                              preIcon: Icons.lock,
                              isPassword: isPassword,
                              suffixIcon: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixPressed: () {
                                setState(() {
                                  isPassword = !isPassword;
                                });
                              },
                              validator: (passwordController) {
                                if (passwordController.toString().isEmpty) {
                                  return isArabic
                                      ? 'أدخل كلمة المرور!'
                                      : 'Password Field is Empty!';
                                } else if (passwordController
                                        .toString()
                                        .length <=
                                    6) {
                                  return isArabic
                                      ? 'يجب أن تكون كلمة المرور أكبر من 6 أحرف '
                                      : 'Password must be greater than 6 characters!';
                                }
                                return null;
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            defaultButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const MainPage()),
                                    (Route<dynamic> route) => false,
                                  );
                                }
                              },
                              text: isArabic ? 'دخول' : 'login'.toUpperCase(),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    isArabic
                                        ? 'نسيت كلمة المرور؟'
                                        : 'Forget Your Password?',
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
