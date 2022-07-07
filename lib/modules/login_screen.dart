import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/cache_helper.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  /*
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
  */

  int initialValue = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is LoginSuccessState) {
            if (state.currentUser.status.toString() == "success") {
              //print(state.currentUser.message);

              AppCubit.get(context).enterSelectedRole();
              CacheHelper.putData(key: 'token', value: state.currentUser.userLogin?.token).then((value){
                navigateToThenRemove(context,AppCubit.get(context).selectedRoleMainPage);
              });

            }else if(state.currentUser.status.toString() == "fail"){
              //print(state.currentUser.message);
              showToast('The Email or password you entered doesn\'t appear to belong to an account. '
                  'Please check your Email or password and try again.', ToastStates.Error);
              /*AlertDialog(
                title: const Text('Incorrect Email or password'),
                content: const SingleChildScrollView(
                  child: Text('The Email or password you entered does n\'t appear to belong to an account. '
                      'Please check your Email or password and try again.'),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );*/

            }
          }
        },
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
                          height: height / 65,
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/SAAS Logo 1.png',
                            width: width/3,
                            height: height/3.3,
                          ),
                        ),
                        SizedBox(
                          height: height / 65,
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
                                      } else /*if (!isEmail) {
                                        return isArabic
                                            ? 'تحقق من بريدك الإلكتروني'
                                            : 'Check Your Email';
                                      }*/
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
                                      } else /*if (!ispass) {
                                        return isArabic
                                            ? 'تحقق من كلمة المرور'
                                            : 'Check Your Password, Please!';
                                      }*/
                                        return null;
                                    },
                                  ),
                                  SizedBox(
                                    height: height / 65,
                                  ),
                                  ConditionalBuilder(
                                    condition: state is! LoginLoadingState,
                                    builder: (context) => defaultButton(
                                      function: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.userLogin(emailController.text,
                                              passwordController.text);
                                        }
                                      },
                                      text: isArabic
                                          ? 'دخول'
                                          : 'login'.toUpperCase(),
                                    ),
                                    fallback: (context) => const Center(child: CircularProgressIndicator(),),
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
