import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:native_pdf_renderer/native_pdf_renderer.dart';

class PdfPreview extends StatefulWidget {
  final String name;
  final String url;
  const PdfPreview({Key? key, required this.name, required this.url})
      : super(key: key);

  @override
  State<PdfPreview> createState() => _PdfPreviewState();
}

class _PdfPreviewState extends State<PdfPreview> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getPdfpreview(),
      builder: (context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Container(
              height: 150,
              width: 200,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10)
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(child: LinearProgressIndicator()),
            ),
          );
        } else {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Cannot Load'),
            );
          }
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 150,
                width: 200,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 10)
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: snapshot.data ??
                        const AssetImage('images/pdfImage.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: Text(
                    widget.name,
                    textAlign: TextAlign.center,
                  ),
                  height: 40,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(25, 20),
                      topRight: Radius.elliptical(25, 20),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }

  Future<ImageProvider> getPdfpreview() async {
    try {
      final file = await DefaultCacheManager().getSingleFile(
        widget.url.replaceAll('localhost', '192.168.1.18'),
      );
      final document = await PdfDocument.openData(await file.readAsBytes());
      final page = await document.getPage(1);
      final pageImage = await page.render(width: 200, height: 150);
      await page.close();
      return MemoryImage(pageImage!.bytes);
    } catch (e) {
      // print('message' + e.toString());
      return const AssetImage('images/pdfImage.png');
    }
  }
}
