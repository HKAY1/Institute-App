// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'assignment.dart';
import '../../../colorScheme.dart';
import 'notes.dart';
import 'testseries.dart';

class StudyMaterial extends StatefulWidget {
  const StudyMaterial({Key? key}) : super(key: key);

  @override
  State<StudyMaterial> createState() => _StudyMaterial();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StudyMaterial extends State<StudyMaterial> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // List<Widget> _widgetOptions = <Widget>[

    // ];
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
            Notes(isEMpty: false),
            Assignment(),
            TestSeries(),
          ],
        ),

        // bottomNavigationBar: BottomNavigationBar(
        //   backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.note_alt),
        //       label: 'Notes',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.assignment),
        //       label: 'Assignment',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.assessment_rounded),
        //       label: 'Test Series',
        //     ),
        //   ],
        //   currentIndex: _selectedIndex,
        //   selectedItemColor: Colors.white,
        //   onTap: (i) {
        //     setState(() {
        //       _selectedIndex = i;
        //     });
        //   },
        // ),
      ),
    );
  }
}
