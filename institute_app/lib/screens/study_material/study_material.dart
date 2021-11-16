// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imstitute/controller/study_material_controller.dart';
import 'package:imstitute/custome/colorScheme.dart';

class StudyMaterial extends StatefulWidget {
  final subjects = <String>[
    'Physics',
    'Chemistry',
    'Biology',
    'Mathmetics',
    'English',
    'Hindi',
    'Computer Science',
  ];
  StudyMaterial({Key? key}) : super(key: key);

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
      body: ListView.builder(
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 15, right: 15),
        itemBuilder: (context, item) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/study', arguments: cont.subj[item]);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: cardcolor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cont.subj[item],
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight:
                          Theme.of(context).textTheme.headline2!.fontWeight,
                      color: bodycolor,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Flopin Sir',
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline4!.fontSize,
                      fontWeight:
                          Theme.of(context).textTheme.headline4!.fontWeight,
                      color: bodycolor,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: cont.subj.length,
      ),
    );
  }
}
