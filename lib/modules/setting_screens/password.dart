import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';
import 'package:saas/main.dart';

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
          isArabic ? 'تغيير كلمة المرور' : 'Change Password',
          style: isArabic
              ? arTitleStyle(
                  color: defaultColor, size: 20, weight: FontWeight.w600)
              : titleStyle(
                  color: defaultColor, size: 20, weight: FontWeight.w600),
        ),

        //leading: IconButton(
        //  icon: isArabic
        //      ? const Icon(Icons.arrow_back_ios_new_rounded)
        //      : const Icon(Icons.arrow_forward_ios_rounded),
        //  onPressed: () {
        //    Navigator.pop(context);
        //  },
        // ),
        backgroundColor: defaultBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: defaultBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: defaultBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isArabic ? 'أدخل كلمة مرورك :' : 'Enter your password:',
                        style: isArabic
                            ? arBodyStyle(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold)
                            : bodyStyle3(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold),
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
                            return isArabic
                                ? 'أدخل كلمة المرور السابقة!'
                                : 'Enter the old password!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'أدخل كلمة المرور الجديدة :'
                            : 'Enter a new password:',
                        style: isArabic
                            ? arBodyStyle(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold)
                            : bodyStyle3(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold),
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
                            return isArabic
                                ? 'حقل كلمة المرور فارغ!'
                                : 'Your password is empty!';
                          } else if (newPasswordController.toString().length <=
                              6) {
                            return isArabic
                                ? 'كلمة المرور يجب أن تكون أكبر من 6 أحرف'
                                : 'Password must be greater than 6 characters';
                          }
                          return null;
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        isArabic
                            ? 'تأكيد كلمة المرور الجديدة :'
                            : 'Confirm the new password:',
                        style: isArabic
                            ? arBodyStyle(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold)
                            : bodyStyle3(
                                size: 16,
                                color: defaultColor,
                                weight: FontWeight.bold),
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
                        text: isArabic ? 'حفظ التغييرات' : 'Save Changes',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
