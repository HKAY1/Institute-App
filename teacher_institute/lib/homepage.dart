// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'screens/event.dart';
import 'screens/study_material/study_material.dart';
import 'screens/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _myindex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _myindex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event_note_outlined),
              label: 'Events',
              // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: 'Study Material',
              // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
          ],
          onTap: (i) {
            setState(() {
              _myindex = i;
            });
          },
        ),
        body: mylist.elementAt(_myindex),
      ),
    );
  }
}

final mylist = <Widget>[
  Home(),
  Calender(),
  StudyMaterial(),
];
