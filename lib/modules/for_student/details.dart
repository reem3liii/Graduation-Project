import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:saas/main.dart';
import 'package:saas/shared/bloc/cubit.dart';
import 'package:saas/shared/bloc/states.dart';
import 'package:saas/shared/components.dart';
import 'package:saas/shared/data.dart';
import 'package:saas/shared/colors.dart';

class Details extends StatefulWidget {
   Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
   @override
   Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
     int standard = 2;

     AppCubit cubitDegrees = AppCubit.get(context);
     return BlocProvider(
       create: (BuildContext context) => AppCubit(),
       child: BlocConsumer<AppCubit,AppStates>(
         listener: (BuildContext context,AppStates state){},
         builder: (BuildContext context,AppStates state){
           return Scaffold(
             appBar: AppBar(
               title: Text(
                 isArabic ? 'تقرير الدرجات' : 'Degrees Report',
                 style: isArabic
                     ? arTitleStyle(
                   size: 20,
                   color: Colors.white,
                 )
                     : AppBarTheme.of(context).titleTextStyle,
               ),
               automaticallyImplyLeading: false,
             ),
             //backgroundColor: Colors.grey.shade100,
             body: SingleChildScrollView(
               physics: const BouncingScrollPhysics(),
               child: Column(
                 children: [
                   const SizedBox(
                     height: 20,
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       left: 20,
                       right: 20,
                     ),
                     child: ListView.separated(
                         physics: const BouncingScrollPhysics(),
                         shrinkWrap: true,
                         itemBuilder: (context, index) => Container(
                           decoration: BoxDecoration(
                             color: AppCubit.get(context).isLightTheme?
                             Colors.white
                                 :
                             Colors.black.withOpacity(0.8),
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
                                     SizedBox(
                                       width: width / 5,
                                       child: Padding(
                                         padding: const EdgeInsets.all(5),
                                         child: GestureDetector(
                                           child: Text(
                                             semesters[index].keys.toList().first,
                                             style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                               fontSize: width/15,
                                               fontWeight: FontWeight.w500,
                                               color: AppCubit.get(context).isLightTheme? defaultColor : defaultLightColor,
                                             ),
                                           ),
                                           onTap: () {
                                             setState(() {
                                               cubitDegrees.visible(index);
                                             });
                                             /*setState(() {
                                             arrayOfVisible[index] =
                                             !arrayOfVisible[index];
                                           });*/
                                           },
                                         ),
                                       ),
                                     ),
                                     Column(
                                       children: [
                                         Text(
                                           '   GPA',
                                           style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                             fontSize: width/30,
                                           ),
                                         ),
                                         SizedBox(
                                           height: height / 200,
                                         ),
                                         Stack(
                                           children: [
                                             LinearPercentIndicator(
                                               width: width / 2,
                                               animation: true,
                                               animationDuration: 750,
                                               lineHeight: height / 35,
                                               percent: semesters[index]
                                                   .values
                                                   .last
                                                   .toDouble() / 4,
                                               progressColor: semesters[index]
                                                   .values
                                                   .last
                                                   .toDouble() > standard
                                                   ? defaultGreenColor.shade300
                                                   : Colors.red.shade400,
                                               backgroundColor: AppCubit.get(context).isLightTheme? Colors.grey.shade200 : Colors.grey.shade800,
                                               barRadius: const Radius.circular(12),
                                               curve: Curves.easeInOut,
                                             ),
                                             Positioned(
                                               top: 1,
                                               left: 14,
                                               child: Text(
                                                 semesters[index]
                                                     .values
                                                     .last
                                                     .toString(),
                                                 style: bodyStyle(
                                                   size: width / 30,
                                                   weight: FontWeight.w600,
                                                   color: Colors.white,
                                                 ),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ],
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                     ),
                                   ],
                                 ),
                                 Visibility(
                                   visible: cubitDegrees.arrayOfVisible[index],
                                   child: Container(
                                     padding: const EdgeInsets.symmetric(
                                         vertical: 10, horizontal: 20),
                                     child: Column(
                                       children: [
                                         ListView.separated(
                                             physics: const ScrollPhysics(),
                                             shrinkWrap: true,
                                             itemBuilder: (context, sub) => Row(
                                                 mainAxisAlignment:
                                                 MainAxisAlignment
                                                     .spaceBetween,
                                                 children: [
                                                   Text(
                                                     isArabic
                                                         ? arSubjects[index]
                                                         .keys
                                                         .toList()[sub]
                                                         : subjects[index]
                                                         .keys
                                                         .toList()[sub],
                                                     style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                                       fontSize: 16,
                                                       fontWeight: FontWeight.w500,
                                                     ),
                                                   ),
                                                   Text(
                                                     subjects[index][
                                                     subjects[index]
                                                         .keys
                                                         .toList()[sub]]
                                                         .toString(),
                                                     style: bodyStyle(
                                                         size: 16,
                                                         weight: FontWeight.w600,
                                                         color: double.parse(subjects[
                                                         index][subjects[
                                                         index]
                                                             .keys
                                                             .toList()[sub]]
                                                             .toString()) >
                                                             standard
                                                             ? Colors.green
                                                             : Colors.red),
                                                   ),
                                                 ]),
                                             separatorBuilder: (context, sub) =>
                                             const SizedBox(height: 10),
                                             itemCount: subjects[index].length)
                                       ],
                                     ),
                                   ),
                                 )
                               ],
                               crossAxisAlignment: CrossAxisAlignment.start,
                             ),
                           ),
                         ),
                         separatorBuilder: (context, index) => SizedBox(
                           height: height / 50,
                         ),
                         itemCount: int.parse(data[5].toString())),
                   ),
                   const SizedBox(
                     height: 20,
                   ),
                 ],
               ),
             ),
           );
         },
       ),
     );
   }
}

