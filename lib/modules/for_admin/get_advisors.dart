import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';

import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

class GetAdvisors extends StatelessWidget {
  GetAdvisors(this.advisorsData, {Key? key}) : super(key: key);

  List<dynamic> advisorsData;

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
                  isArabic ? 'المرشدين الأكادميين' : 'The Advisors',
                  style: isArabic
                      ? arTitleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600)
                      : titleStyle(
                          color: defaultColor,
                          size: 20,
                          weight: FontWeight.w600),
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
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Container(
                        width: double.infinity,
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  widthSpace(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '  ${advisorsData[index]['fullName']}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: defaultColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ID: ${advisorsData[index]['id']}\nLevel: ${advisorsData[index]['level']}\nEmail: ${advisorsData[index]['email']}\nPhone:  ${advisorsData[index]['phone']}',
                                              style: bodyStyle2(size: 16),
                                            ),
                                            heightSpace(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      IconButton(
                                          iconSize: 22,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.cancel_rounded,
                                            color: Colors.red.shade700,
                                          )),
                                      IconButton(
                                          iconSize: 22,
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.edit,
                                            color: defaultColor,
                                          )),
                                    ],
                                  ),
                                  widthSpace(),
                                ],
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                      itemCount: advisorsData.length,
                      separatorBuilder: (context, index) => SizedBox(
                        height: height / 50,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
