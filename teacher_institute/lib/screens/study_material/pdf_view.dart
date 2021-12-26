import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:teacher_institute/modals/teacher_studymodal.dart';

class PdfView extends StatefulWidget {
  const PdfView({Key? key}) : super(key: key);

  @override
  _PdfViewState createState() => _PdfViewState();
}

class _PdfViewState extends State<PdfView> {
  final file = Get.arguments as FileClass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(),
        automaticallyImplyLeading: true,
        title: Text(file.name),
      ),
      body: SfPdfViewer.network(
        file.url.replaceAll('localhost', '192.168.1.18'),
        onDocumentLoadFailed: (d) {},
      ),
    );
  }
}
