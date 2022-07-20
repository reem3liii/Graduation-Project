import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'dart:io';

import 'package:saas/shared/design/colors.dart';
import 'package:saas/shared/items/components.dart';


class PdfViewerScreen extends StatefulWidget {
  final File file;

  const PdfViewerScreen({Key? key,required this.file}) : super(key: key);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file.path);
    return Scaffold(
        appBar: AppBar(
                leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                backgroundColor: defaultColor,
                centerTitle: true,
                iconTheme: IconThemeData(color: lightDefaultColor),
                title: Text(
                  name,
                  style: titleStyle(
                    size: 20,
                    color: Colors.white,
                  ),
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: defaultColor,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
            
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
