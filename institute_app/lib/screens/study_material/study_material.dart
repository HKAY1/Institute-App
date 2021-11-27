// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/study_material_controller.dart';
import 'package:imstitute/custome/colorScheme.dart';
import 'package:imstitute/custome/customeWidgets.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({Key? key}) : super(key: key);

  @override
  State<StudyMaterial> createState() => _StudyMaterial();
}

class _StudyMaterial extends State<StudyMaterial> {
  var cont = Get.put(StudyController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Subjects'),
      ),
      body: Obx(() {
        if (cont.loadingSubj.value) {
          return Center(
            child: CustomeLoading(
              color: Colors.blueAccent,
            ),
          );
        } else {
          if (cont.subjlist.isEmpty) {
            return Container(
              child: Image.asset('images/nodownloads.png'),
              margin: EdgeInsets.only(top: size.height * 0.1),
            );
          }
          return GridView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 40,
            ),
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
                  cont.subject(cont.subjlist[item].subject);
                  Get.toNamed('/study');
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  width: size.width * 0.90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: cardcolor,
                    // gradient: getGradient(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        cont.subjlist[item].subject,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight:
                              Theme.of(context).textTheme.headline2!.fontWeight,
                          color: Colors.white,
                        ),
                      ),
                      // SizedBox(height: 20),
                      Text(
                        cont.subjlist[item].teacherName,
                        style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.headline4!.fontSize,
                          fontWeight:
                              Theme.of(context).textTheme.headline4!.fontWeight,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: cont.subjlist.length,
          );
        }
      }),
    );
  }

  LinearGradient getGradient() {
    final colors = <Color>[
      Color(0xff86E3CE),
      // Color(0xffD0E6A5),
      Color(0xffFFDD94),
      Color(0xffFA8978),
      Color(0xffCCABD8),
      Color(0xff7BDFF2),
      Color(0xffB2F7EF),
      Color(0xffEF77F6),
      Color(0xffF7D6E0),
      Color(0xffF2B5D4),
    ];
    colors.shuffle();
    return LinearGradient(
      colors: [colors[0], colors[1]],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
  }
}
