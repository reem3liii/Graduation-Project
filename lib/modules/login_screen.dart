import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';
import 'main_page.dart';

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
    String p = '[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*@ci.suez.edu.eg';
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
                              'Sign In',
                                style: titleStyle(size: 25,),
                            ),
                            heightSpace(),
                            heightSpace(),
                            defaultTextField(
                              textEditingController: emailController,
                              textInputType: TextInputType.emailAddress,
                              hintText: 'E-mail',
                              preIcon: Icons.email,
                              validator: (emailController) {
                                if (emailController.toString().isEmpty) {
                                  return 'Email Field is Empty!';
                                } else if (!isEmail) {
                                  return 'Check Your Email';
                                }
                                return null;
                              },
                            ),
                            heightSpace(),
                            defaultTextField(
                              textEditingController: passwordController,
                              textInputType: TextInputType.visiblePassword,
                              hintText: 'Password',
                              preIcon: Icons.lock,
                              isPassword: isPassword,
                              suffixIcon: isPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              suffixPressed: (){
                                      setState(() {
                                        isPassword = !isPassword;
                                      });
                                    },
                              validator: (passwordController) {
                                if (passwordController.toString().isEmpty) {
                                  return 'Password Field is Empty!';
                                } else if (passwordController
                                        .toString()
                                        .length <= 6) {
                                  return 'Password must be greater than 6 characters!';
                                }
                                return null;
                              },
                            ),
                            heightSpace(),
                            heightSpace(),
                            defaultButton(
                              function: (){
                                if(formKey.currentState!.validate()){
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context)=> const MainPage()),
                                        (Route<dynamic> route) => false,
                                  );
                                }
                              },
                              text: 'login'.toUpperCase(),
                            ),
                            Row(
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forget Your Password?',
                                    style: TextStyle(
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