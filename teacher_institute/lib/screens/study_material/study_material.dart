// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teacher_institute/screens/study_material/add_material.dart';
import '../../coustom/customeWidgets.dart';
import '../../studydata/mydata.dart';
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
    // Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Study Material'),
        ),
        floatingActionButton:FloatingActionButton.extended(onPressed: (){
           Navigator.push(context, MaterialPageRoute(builder:(context)=>AddMaterial() ),);
        }, label: Text('Upload'),icon: Icon(CupertinoIcons.add),),
        body: MyBackground(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 25, horizontal: 60),
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: Theme.of(context).scaffoldBackgroundColor,
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
                      text: 'Test Series',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
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
            ],
          ),
        ),
      ),
    );
  }
}
