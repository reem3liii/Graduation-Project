import 'package:flutter/material.dart';
import 'package:saas/modules/for_advisor/regestration_screen.dart';
import 'package:saas/modules/for_advisor/student_screen.dart';
import 'package:saas/modules/for_student/profile_screen.dart';
import 'package:saas/modules/gpa_calculator/gpa_page.dart';
import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/advisor_components.dart';
import 'package:saas/shared/items/components.dart';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:saas/modules/for_advisor/pdfViewer_screen.dart';


class AdvisorScreen extends StatelessWidget {
  const AdvisorScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        children: [
          ClipPath(
            clipper: CustomClipPath(),
            child: Container(
              width: double.infinity,
              height: height / 3.8,
              decoration: BoxDecoration(
                color: defaultColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Welcome to SAAS ',
                        style: titleStyle().copyWith(color: Colors.white)),
                    Text(
                      'the perfect system for any acadimic advisor ',
                      style: titleStyle().copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 2 * width / 3.3,
                              height: height / 5,
                              child: (mainCard(
                                  width: 2 * width / 3.3,
                                  height: height / 5,
                                  label: 'class schedule',
                                  icon: Icons.table_view,
                                  iconWidth: width / 8, fun: (){}))),
                          Row(
                            children: [
                              SizedBox(
                                  width: width / 3.3,
                                  height: height / 5,
                                  child: mainCard(
                                      width: width / 3.3,
                                      height: height / 5,
                                      label: 'Guide Book',
                                      icon: Icons.book_rounded,
                                      iconWidth: width / 8,
                                      context: context,
                                      fun: 
                                        () async {
                                          const path = 'assets/daleel.pdf';
                                          final file =
                                              await PDFApi.loadAsset(path);
                                          openPDf(context, file);
                                        }
                                      )),
                              SizedBox(
                                width: width / 3.3,
                                height: height / 5,
                                child: mainCard(
                                    width: width / 3.3,
                                    height: height / 5,
                                    label: 'subjects',
                                    icon: Icons.note_alt_outlined,
                                    iconWidth: width / 8, fun: (){}),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: width / 3.3,
                        height: 2 * height / 5,
                        child: mainCard(
                            width: width / 3.3,
                            height: 2 * height / 5,
                            label: 'students',
                            icon: Icons.person,
                            iconWidth: width / 8,
                            context: context,
                            fun: () {
                              navigateTo(context, const StudentScreen());
                            }))
                  ],
                ),
                Row(
                  children: [
                    //    Expanded(
                    //      child: Column(
                    //        crossAxisAlignment: CrossAxisAlignment.start,
                    //        children: [
                    //          SizedBox(
                    //                                width: width/3.3,
                    //                                height: height/5,

                    //                               child:
                    //                             mainCard(width: width/3.3, height: height/5, label: 'registration', icon: Icons.note_add_outlined, iconWidth: width/8)
                    //                              ),
                    //        ],
                    //      ),
                    //    ),
                    //  SizedBox(
                    //                          width: 2*width/3.3,
                    //                          height: height/5,

                    //                         child:
                    //                       (  mainCard(width: 2*width/3.3, height: height/5, label: 'profs schedule',icon: Icons.table_view,iconWidth: width/8))),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 2 * width / 3.3,
                              height: height / 5,
                              child: (mainCard(
                                  width: 2 * width / 3.3,
                                  height: height / 5,
                                  label: 'subject regesteration',
                                  icon: Icons.table_view,
                                  iconWidth: width / 8,
                                  context: context,
                                  fun: () {
                                    navigateTo(
                                        context, const SubjectRegestrationScreen());
                                  }))),
                        ],
                      ),
                    ),

                    SizedBox(
                        width: width / 3.3,
                        height: height / 5,
                        child: mainCard(
                            width: width / 3.3,
                            height: height / 5,
                            label: 'GPA calculator',
                            icon: Icons.book_rounded,
                            iconWidth: width / 8,
                            context: context,
                            fun: () {
                              navigateTo(context, GPACalculator());
                            }
                            )
                            ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void openPDf(BuildContext context, File file) => Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PdfViewerScreen(file: file)));
}

class PDFApi {
  static Future<File> loadAsset(String path) async {
    final data = await rootBundle.load(path);
    final bytes = data.buffer.asUint8List();
    return _storeFile(path, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
