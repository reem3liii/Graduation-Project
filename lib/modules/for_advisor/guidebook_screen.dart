import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:saas/modules/for_advisor/pdfViewer_screen.dart';

class GuideboocScreen extends StatelessWidget {
  const GuideboocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('guide book'),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                const path = 'assets/daleel.pdf';
                final file = await PDFApi.loadAsset(path);
                openPDf(context, file);
              },
              child: const Text('data'))
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
