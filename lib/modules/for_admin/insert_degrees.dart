import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/items/data.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/models.dart';

var arrayOfVisible =
    List<bool>.generate(int.parse(data[5].toString()), (i) => false);

class InsertDegrees extends StatefulWidget {
  const InsertDegrees({Key? key}) : super(key: key);

  @override
  State<InsertDegrees> createState() => _InsertDegreesState();
}

class _InsertDegreesState extends State<InsertDegrees> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                isArabic ? 'ادخال الدرجات' : 'Insert degrees',
                style: isArabic
                    ? arTitleStyle(
                        color: defaultColor, size: 20, weight: FontWeight.w600)
                    : titleStyle(
                        color: defaultColor, size: 20, weight: FontWeight.w600),
              ),
              backgroundColor: defaultBackgroundColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: defaultBackgroundColor,
                statusBarIconBrightness: Brightness.dark,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  heightSpace(),
                  heightSpace(),
                  ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 0,
                                    offset: Offset(0.2, 0.2),
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          courses[index].courseName,
                                          maxLines: 2,
                                          style: TextStyle(
                                            color: defaultColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                        Text(
                                          courses[index].courseCode,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  widthSpace(),
                                  Expanded(
                                    child: TextField(
                                      //controller: controller,
                                      keyboardType: TextInputType.number,
                                      maxLength: 3,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            borderSide: BorderSide(
                                                color: defaultColor)),
                                        labelText:
                                            isArabic ? 'تقدير المقرر' : "GPA",
                                        counterText: "",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: height / 50,
                          ),
                      itemCount: courses.length),
                  heightSpace(),
                  heightSpace(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: defaultButton(
                      function: () {},
                      text: isArabic ? 'حفظ' : 'Save',
                    ),
                  ),
                  heightSpace(),
                  heightSpace(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
