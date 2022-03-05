import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saas/shared/components/components.dart';
import 'package:saas/shared/styles/colors.dart';

var formKey2 = GlobalKey<FormState>();
var phoneController = TextEditingController();
var confirmController = TextEditingController();

class PhoneScreen extends StatelessWidget {
  const PhoneScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change Phone Number',
          style: titleStyle(
              color: defaultColor, size: 20, weight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: defaultBackArrow(),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                  key: formKey2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter your phone number:',
                        style: bodyStyle3(
                            size: 16, color: defaultColor, weight: FontWeight.bold),
                      ),
                      heightSpace(),
                      defaultTextField(
                        textEditingController: phoneController,
                        textInputType: TextInputType.phone,
                        preIcon: Icons.phone_android_outlined,
                        validator: (phoneController) {
                          if (phoneController.toString().isEmpty) {
                            return 'Please enter your phone number!';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      Text(
                        'Enter the code sent to you to verify your number:',
                        style: bodyStyle3(
                            size: 16, color: defaultColor, weight: FontWeight.bold),
                      ),
                      heightSpace(),
                      defaultTextField(
                        textEditingController: confirmController,
                        textInputType: TextInputType.number,
                        preIcon: Icons.comment_outlined,
                        validator: (confirmController) {
                          if (confirmController.toString().isEmpty) {
                            return 'Check your SMS then enter the sent code';
                          } else {
                            return null;
                          }
                        },
                      ),
                      heightSpace(),
                      heightSpace(),
                      defaultButton(
                        function: () {
                          if (formKey2.currentState!.validate()) {
                            print('Phone number changed');
                          }
                        },
                        text: 'Save Changes',
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
