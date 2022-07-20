import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saas/shared/items/components.dart';
import 'package:saas/shared/design/colors.dart';
import '../../shared/bloc/cubit.dart';
import '../../shared/bloc/states.dart';

class GetAdvisors extends StatefulWidget {
  GetAdvisors(this.advisorsData, this.token, {Key? key}) : super(key: key);

  List<dynamic> advisorsData;
  String token;

  @override
  State<GetAdvisors> createState() => _GetAdvisorsState();
}

class _GetAdvisorsState extends State<GetAdvisors> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is DeleteAdvisorSuccessState) {
            showToast(state.responce['message'], ToastStates.Success);
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);

          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'The Advisors',
                  style: titleStyle(
                      color: defaultColor, size: 20, weight: FontWeight.w600),
                ),
                backgroundColor: defaultBackgroundColor,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultBackgroundColor,
                  statusBarIconBrightness: Brightness.dark,
                ),
              ),
              body: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ConditionalBuilder(
                      builder: (BuildContext context) {
                        return ListView.separated(
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widthSpace(),
                                SizedBox(
                                  width: 270,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      heightSpace(),
                                      Text(
                                        '  ${widget.advisorsData[index]['fullName']}',
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
                                              'ID: ${widget.advisorsData[index]['id']}\nLevel: ${widget.advisorsData[index]['level']}\nEmail: ${widget.advisorsData[index]['email']}\nPhone:  ${widget.advisorsData[index]['phone']}',
                                              style: bodyStyle2(size: 16),
                                            ),
                                            heightSpace(),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    iconSize: 22,
                                    onPressed: () {
                                      deleteDialog(context, () {
                                        cubit.deleteAdvisor(widget.token,
                                            widget.advisorsData[index]['id']);
                                        widget.advisorsData.removeAt(index);
                                      }, () {
                                        Navigator.pop(context);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel_rounded,
                                      color: Colors.red.shade700,
                                    )),
                              ],
                            ),
                          ),
                          itemCount: widget.advisorsData.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: height / 50,
                          ),
                        );
                      },
                      condition: widget.advisorsData.isNotEmpty,
                      fallback: (BuildContext context) {
                        return Center(
                          child: Column(
                            children: [
                              Image.asset(
                            'assets/images/noCourses.png',
                            width: width/1.5,
                          ),
                              Text(
                                "There are no advisors.\nPlease add new ones!",
                                style: bodyStyle3(
                                size: 18,
                                //color: defaultColor,
                                weight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
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
