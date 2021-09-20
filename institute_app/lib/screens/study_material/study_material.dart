// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:imstitute/mydata.dart';
import 'notes.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({Key? key}) : super(key: key);

  @override
  State<StudyMaterial> createState() => _StudyMaterial();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StudyMaterial extends State<StudyMaterial> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Study Material'),
          centerTitle: true,
          bottom: TabBar(
            tabs: const [
              Tab(
                text: 'Notes',
              ),
              Tab(
                text: 'Assignment',
              ),
              Tab(
                text: 'Text Series',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MyDataList(
              mydata: notes,
            ),
            MyDataList(
              mydata: assignment,
            ),
            MyDataList(
              mydata: testseries,
            ),
          ],
        ),
      ),
    );
  }
}
