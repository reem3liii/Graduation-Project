import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'for_student/main_page.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  bool get isEmail {
    String p =
        '[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+(?:.[a-z0-9!#\$%&\'*+/=?^_`{|}~-]+)*@ci.suez.edu.eg';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(emailController.toString());
  }

  bool get ispass {
    String pattern =
        '^(?=.*[a-z])(?=.*[A-Z])(?=.*d)(?=.*[@!%*?&])[A-Za-zd@!%*?&]';
    RegExp regExp2 = RegExp(pattern);
    return regExp2.hasMatch(passwordController.toString());
  }

  int initialValue = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(0.0),
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

                        SizedBox(
                          height: height / 150,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/SAAS Logo 1.png',
                            width: 160,
                            height: 160,
                          ),
                        ),
                        SizedBox(
                          height: height / 35,
                        ),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.98),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 25),
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
                                  SizedBox(
                                    height: height / 45,
                                  ),
                                  /*Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ToggleSwitch(
                                        totalSwitches: 3,
                                        labels: const ['Student','Adviser', 'Admin'],
                                        fontSize: 16,
                                        activeBgColors: [
                                          [defaultColor1],
                                          [defaultColor1],
                                          [defaultColor1],
                                        ],
                                        inactiveBgColor: Colors.white,
                                        activeFgColor: Colors.white,
                                        inactiveFgColor: Colors.grey.shade600,
                                        borderColor: const [Colors.grey],
                                        borderWidth: 0.7,
                                        cornerRadius: 30,
                                        initialLabelIndex: cubit.selectedMode,
                                        minWidth: 112,
                                        minHeight: 63,
                                        onToggle: (index) {
                                          // = index!;
                                          cubit.changeMode(index!);
                                          print('switched to $index ');
                                        },
                                      ),
                                    ],
                                  ),*/
                                  SizedBox(
                                    height: height / 65,
                                  ),
                                  defaultTextField(
                                    textEditingController: emailController,
                                    textInputType: TextInputType.emailAddress,
                                    labelText: isArabic
                                        ? 'البريد الإلكتروني'
                                        : 'E-mail',
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
                                  SizedBox(
                                    height: height / 65,
                                  ),
                                  defaultTextField(
                                    textEditingController: passwordController,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    labelText:
                                        isArabic ? 'كلمة المرور' : 'Password',
                                    preIcon: Icons.lock,
                                    isPassword: cubit.isPassword,
                                    suffixIcon: cubit.isPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    suffixPressed: () {
                                      cubit.ispassword();
                                    },
                                    validator: (passwordController) {
                                      if (passwordController
                                          .toString()
                                          .isEmpty) {
                                        return isArabic
                                            ? 'أدخل كلمة المرور!'
                                            : 'Password Field is Empty!';
                                      } else if (!ispass) {
                                        return isArabic
                                            ? 'تحقق من كلمة المرور'
                                            : 'Check Your Password, Please!';
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: height / 65,
                                  ),
                                  /*RadioListTile<int>(
                                      title: const Text('Student'),
                                      activeColor: defaultColor,
                                      value: 0,
                                      groupValue: cubit.selectedMode,
                                      onChanged: (value) =>
                                          cubit.changeMode(0)),
                                  RadioListTile<int>(
                                      title: const Text('Adviser'),
                                      activeColor: defaultColor,
                                      value: 1,
                                      groupValue: cubit.selectedMode,
                                      onChanged: (value) =>
                                          cubit.changeMode(1)),
                                  RadioListTile<int>(
                                      title: const Text('Administrator'),
                                      activeColor: defaultColor,
                                      value: 2,
                                      groupValue: cubit.selectedMode,
                                      onChanged: (value) =>
                                          cubit.changeMode(2)),*/
                                  SizedBox(
                                    height: height / 150,
                                  ),
                                  defaultButton(
                                    function: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.enterSelectedMode();
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  cubit.selectedModeMainPage ),
                                          (Route<dynamic> route) => false,
                                        );
                                      }
                                    },
                                    text: isArabic
                                        ? 'دخول'
                                        : 'login'.toUpperCase(),
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
        },
      ),
    );
  }
}
