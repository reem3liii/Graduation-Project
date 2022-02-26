import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/modules/for_student/setting_screen.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

var formKey = GlobalKey<FormState>();
var passwordController = TextEditingController();
var newPasswordController = TextEditingController();
var confirmPasswordController = TextEditingController();
bool isPassword = true;

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Password',
          style: titleStyle(
              color: defaultColor, size: 20, weight: FontWeight.w600),
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
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your password:',
                  style: bodyStyle3(
                      size: 16, color: defaultColor, weight: FontWeight.bold),
                ),
                heightSpace(),
                defaultTextField(
                  textEditingController: passwordController,
                  textInputType: TextInputType.visiblePassword,
                  isPassword: isPassword,
                  preIcon: Icons.lock_open_outlined,
                  //suffixIcon: isPassword? Icons.visibility : Icons.visibility_off,
                  /*suffixPressed: (){
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },*/
                  validator: (passwordController) {
                    if (passwordController.toString().isEmpty) {
                      return 'Enter the old password!';
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpace(),
                heightSpace(),
                Text(
                  'Enter a new password:',
                  style: bodyStyle3(
                      size: 16, color: defaultColor, weight: FontWeight.bold),
                ),
                heightSpace(),
                defaultTextField(
                  textEditingController: newPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  preIcon: Icons.lock_outline_rounded,
                  isPassword: isPassword,
                  //suffixIcon: isPassword? Icons.visibility : Icons.visibility_off,
                  /*suffixPressed: (){
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },*/
                  validator: (newPasswordController) {
                    if (newPasswordController.toString().isEmpty) {
                      return 'Your password is empty!';
                    } else if (newPasswordController.toString().length <= 6) {
                      return 'Password must be greater than 6 characters';
                    }
                    return null;
                  },
                ),
                heightSpace(),
                heightSpace(),
                Text(
                  'Confirm the new password:',
                  style: bodyStyle3(
                      size: 16, color: defaultColor, weight: FontWeight.bold),
                ),
                heightSpace(),
                defaultTextField(
                  textEditingController: confirmPasswordController,
                  textInputType: TextInputType.visiblePassword,
                  preIcon: Icons.lock_clock_outlined,
                  isPassword: isPassword,
                  //suffixIcon: isPassword? Icons.visibility : Icons.visibility_off,
                  /*suffixPressed: (){
                                        setState(() {
                                          isPassword = !isPassword;
                                        });
                                      },*/
                  validator: (confirmPasswordController) {
                    if (confirmPasswordController.toString() !=
                        newPasswordController.toString()) {
                      return null; //'Check your password again!';
                    } else {
                      return null;
                    }
                  },
                ),
                heightSpace(),
                heightSpace(),
                defaultButton(
                  function: () {
                    if (formKey.currentState!.validate()) {
                      print('Password changed');
                    }
                  },
                  text: 'Save Changes',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
