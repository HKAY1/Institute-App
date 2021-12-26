// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/controller/teacher_study_material_controller.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/coustom/customeWidgets.dart';

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
          }
          return ListView.builder(
            itemBuilder: (context, item) {
              return InkWell(
                hoverColor: Colors.transparent,
                onTap: () {
                  Get.toNamed('pdfView',
                      arguments: controller.topics[item].file);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 15, bottom: 10),
                  padding: EdgeInsets.all(15),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: cardcolor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, bottom: 15, right: 5),
                        child: Text(
                          controller.topics[item].topic,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: bodycolor, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: controller.topics.length,
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          );
        },
      ),
    );
  }
}
