// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/controller/teacher_study_material_controller.dart';
import 'package:teacher_institute/coustom/customeWidgets.dart';
import 'package:teacher_institute/screens/study_material/pdf_preview.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({Key? key}) : super(key: key);

  @override
  _TopicPageState createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  var controller = Get.put(StudyController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter ${Get.arguments['chapter']}'),
      ),
      body: GetBuilder<StudyController>(
        init: controller,
        initState: (con) {
          controller.fetchTopics();
        },
        builder: (controller) {
          if (controller.loadingTopics.value) {
            return const Center(
              child: CustomeLoading(
                color: Colors.blueAccent,
              ),
            );
          } else if (controller.topics.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 20, left: 20, right: 20),
              itemCount: controller.topics.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 4
                        : 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, item) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      'pdfView',
                      arguments: controller.topics[item].file,
                    );
                  },
                  child: PdfPreview(
                    name: controller.topics[item].topic,
                    url: controller.topics[item].file.url,
                  ),
                );
              },
            );
          }
          return Center(
            child: Text(
              'No Data',
              style: Theme.of(context).textTheme.headline2,
            ),
          );
        },
      ),
    );
  }
}
