import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';
import 'dart:io';


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
        title: Text(name),

      ),
      body: PDFView(
        filePath: widget.file.path,
      ),
    );
  }
}
