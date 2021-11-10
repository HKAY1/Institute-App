// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:imstitute/models/study_modals.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/study_material_controller.dart';
// import 'package:get/get.dart';
import 'package:imstitute/custome/colorScheme.dart';
// import 'package:imstitute/custome/customeWidgets.dart';

class Notes extends StatefulWidget {
  const Notes({Key? key}) : super(key: key);

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    NotesController controller = Get.put(NotesController());
    // Size size = MediaQuery.of(context).size;
    return GetX<NotesController>(builder: (_) {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return GridView.builder(
        // clipBehavior: Clip.none,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        itemCount: controller.data.length,
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
            onTap: () => Get.toNamed('/inchapter', arguments: {
              'chapter': controller.data[item].chapter,
              'data': controller.data[item].data
            }),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: cardcolor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Chapter',
                          style: Theme.of(context)
                              .textTheme
                              .headline2!
                              .copyWith(color: bodycolor),
                        ),
                        Text(
                          'sdccsjdcvhj sjcbjs asdvc shcvhsdcv gacvhag',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(color: bodycolor),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: -10,
                  left: -5,
                  child: Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 5, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xff75e6da), width: 4),
                    ),
                    child: Text(
                      NumberFormat('00').format(controller.data[item].chapter),
                      style: Theme.of(context).textTheme.headline2!.copyWith(
                            fontSize: 30,
                            color: Color(0xff05445e),
                          ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      );
    });
  }
}

class InChapter extends StatefulWidget {
  const InChapter({Key? key}) : super(key: key);

  @override
  _InChapterState createState() => _InChapterState();
}

class _InChapterState extends State<InChapter> {
  List<Data> data = Get.arguments['data'] ?? [];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter ${Get.arguments['chapter']}'),
      ),
      body: (data.isEmpty)
          ? Container(
              child: Image.asset('images/nodownloads.png'),
              margin: EdgeInsets.only(top: size.height * 0.1),
            )
          : ListView.builder(
              itemBuilder: (context, item) {
                return Container(
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
                          data[item].topic,
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: bodycolor, fontSize: 20),
                        ),
                      ),
                      Text(
                        data[item].file,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline4!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline4!.fontWeight,
                          color: bodycolor,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: data.length,
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            ),
    );
  }
}
