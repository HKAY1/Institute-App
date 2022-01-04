// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_institute/controller/teacher_study_material_controller.dart';
import 'package:teacher_institute/coustom/colorScheme.dart';
import 'package:teacher_institute/screens/study_material/secondary_material.dart';

import 'notes_page.dart';

class StudyChapters extends StatefulWidget {
  const StudyChapters({Key? key}) : super(key: key);

  @override
  State<StudyChapters> createState() => _StudyChaptersState();
}

class _StudyChaptersState extends State<StudyChapters> {
  var controller = Get.put(StudyController());
  List<String> subjects = Get.arguments ?? [];
  final List<String> type = <String>['Notes', 'Assignment', 'Sample Paper'];
  String mat = 'Notes';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed('/addmaterial', arguments: {
              'type': mat,
              'class': controller.clas.value,
              'subject': controller.subject.value
            });
          },
          label: Text('Upload'),
          icon: Icon(CupertinoIcons.add),
        ),
        appBar: AppBar(
          actions: [
            PopupMenuButton(
              // onSelected: (String s) {
              //   controller.subject(s);
              // },
              itemBuilder: (_) {
                return subjects.map((e) {
                  return PopupMenuItem(
                    onTap: () {
                      controller.subject(e);
                    },
                    value: e,
                    child:
                        Text(e, style: Theme.of(context).textTheme.headline4),
                  );
                }).toList();
              },
            )
          ],
          title: Text(
            controller.subject.value,
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(10, 30, 10, 5),
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                isScrollable: false,
                // dragStartBehavior: DragStartBehavior.down,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: cardcolor,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Notes',
                  ),
                  Tab(
                    text: 'Assignment',
                  ),
                  Tab(
                    text: 'Sample Paper',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  TeacherNotes(),
                  SecondaryMaterial(mat: 'Assignment'),
                  SecondaryMaterial(mat: 'Sample_Paper'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
